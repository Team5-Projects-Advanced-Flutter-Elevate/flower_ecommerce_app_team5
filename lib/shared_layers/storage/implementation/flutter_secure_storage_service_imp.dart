import 'package:flower_ecommerce_app_team5/shared_layers/storage/constants/storage_constants.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/storage/contracts/flutter_secure_storage_service_contract.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/storage/handler/storage_execution_handler.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/storage/result/storage_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: SecureStorageService)
class SecureStorageServiceImp implements SecureStorageService {
  final FlutterSecureStorage storageInstance;
  //final ErrorNotifier errorNotifier;

  SecureStorageServiceImp(this.storageInstance);

  @override
  void setStringValue(String key, String value,
      [String widgetName = ""]) async {
    var storageResult = await StorageExecutionHandler.execute<void>(
        () => storageInstance.write(key: key, value: value));
    if (storageResult is StorageErrorResult) {
      debugPrint(
          StorageConstants.errorStoringMessage(storageResult.error.toString()));
      // errorNotifier.setError(
      //     message:
      //     StorageConstants.errorStoringMessage(storageResult.error.toString()),
      //     widgetName: widgetName);
    }
  }

  @override
  Future<String?> getStringValue(String key, [String widgetName = ""]) async {
    var storageResult = await StorageExecutionHandler.execute(
      () => storageInstance.read(key: key),
    );
    switch (storageResult) {
      case StorageSuccessResult<String?>():
        return storageResult.data;
      case StorageErrorResult<String?>():
        debugPrint(StorageConstants.errorReadingMessage(
            storageResult.error.toString()));
      // errorNotifier.setError(
      //     message: StorageConstants.errorDeletingMessage(
      //         storageResult.error.toString()),
      //     widgetName: widgetName);
    }
    return null;
  }

  @override
  Future<void> deleteValue(String key, [String widgetName = ""]) async {
    var storageResult = await StorageExecutionHandler.execute(
      () => storageInstance.delete(key: key),
    );
    if (storageResult is StorageErrorResult) {
      debugPrint(StorageConstants.errorDeletingMessage(
          storageResult.error.toString()));
      // errorNotifier.setError(
      //     message: StorageConstants.errorDeletingMessage(
      //         storageResult.error.toString()),
      //     widgetName: widgetName);
    }
  }
}
