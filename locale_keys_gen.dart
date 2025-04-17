import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  const translationClassPath =
      'lib/shared_layers/localization/generated/locale_keys.g.dart'; // Path to LocaleKeys.dart
  const translationsDir =
      'lib/shared_layers/localization/l10n_json_files'; // Path to JSON translations
  const enJsonFile = '$translationsDir/en.json';
  const arJsonFile = '$translationsDir/ar.json';

  // Load JSON files
  final enJson = loadJson(enJsonFile);
  final arJson = loadJson(arJsonFile);

  // Extract keys
  final keys = <String>{};
  extractKeys(enJson, '', keys);
  extractKeys(arJson, '', keys);

  // Read the existing LocaleKeys file
  final existingKeys = extractExistingKeys(translationClassPath);

  // Merge and update the class
  updateLocaleKeysClass(translationClassPath, keys, existingKeys);
}

/// Load and parse JSON from file
Map<String, dynamic> loadJson(String path) {
  final file = File(path);
  if (!file.existsSync()) {
    debugPrint('Error: File not found - $path');
    return {};
  }
  return json.decode(file.readAsStringSync()) as Map<String, dynamic>;
}

/// Recursively extract all keys, supporting nested JSON
void extractKeys(Map<String, dynamic> json, String prefix, Set<String> keys) {
  json.forEach((key, value) {
    // ignoring comment keys
    if (key.startsWith('//')) return;
    final formattedKey = prefix.isEmpty ? key : '$prefix.$key';
    keys.add(formattedKey);
    if (value is Map<String, dynamic>) {
      extractKeys(value, formattedKey, keys);
    }
  });
}

/// Extract existing keys from LocaleKeys class
Set<String> extractExistingKeys(String filePath) {
  final file = File(filePath);
  if (!file.existsSync()) {
    return {};
  }

  final content = file.readAsStringSync();
  final regex =
      RegExp(r'static const String (\w+) = \"([^\"]+)\";', multiLine: true);
  final existingKeys = <String>{};

  for (final match in regex.allMatches(content)) {
    existingKeys.add(match.group(2)!);
  }

  return existingKeys;
}

/// Update LocaleKeys class by adding new missing keys
void updateLocaleKeysClass(
    String filePath, Set<String> jsonKeys, Set<String> existingKeys) {
  final file = File(filePath);

  // Generate new keys that are not in the existing class
  final newKeys = jsonKeys.difference(existingKeys);

  if (newKeys.isEmpty) {
    debugPrint('No new keys to add. LocaleKeys is up to date.');
    return;
  }

  debugPrint('Adding ${newKeys.length} new keys...');

  final buffer = StringBuffer();
  buffer.writeln('abstract class LocaleKeys {');

  // Keep old keys
  for (final key in existingKeys) {
    buffer.writeln('  static const String ${formatKeyName(key)} = "$key";');
  }

  // Add new keys
  for (final key in newKeys) {
    buffer.writeln('  static const String ${formatKeyName(key)} = "$key";');
  }

  buffer.writeln('}');

  // Write updated class back to file
  file.writeAsStringSync(buffer.toString());
  debugPrint('LocaleKeys updated successfully!');
}

/// Format JSON key into a valid Dart constant name (LowerCamelCase)
String formatKeyName(String key) {
  List<String> parts = key.split('.');

  // Convert each part to PascalCase
  parts = parts
      .map((part) => part
          .split('_')
          .map((word) => word[0].toUpperCase() + word.substring(1))
          .join(''))
      .toList();

  // Convert first letter to lowercase (lowerCamelCase)
  String camelCaseName = parts.join('');
  camelCaseName = camelCaseName[0].toLowerCase() + camelCaseName.substring(1);

  // If there's no scope, prefix with 'general'
  //  if (parts.length == 1) {
  //    return 'general${camelCaseName[0].toUpperCase()}${camelCaseName.substring(1)}';
  //  }

  return camelCaseName;
}
