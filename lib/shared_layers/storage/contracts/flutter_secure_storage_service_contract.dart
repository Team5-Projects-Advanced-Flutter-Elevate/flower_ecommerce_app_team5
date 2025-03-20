abstract interface class SecureStorageService<T> {
  void setStringValue(String key, String value, [String widgetName = ""]);

  Future<String?> getStringValue(String key, [String widgetName = ""]);

  Future<void> deleteValue(String key, [String widgetName = ""]);
}