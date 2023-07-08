import 'package:get_storage/get_storage.dart';

class GetStorageUtil {
  static GetStorage? _getStorage;

  factory GetStorageUtil() => GetStorageUtil._internal();
  static GetStorage? get to => _getStorage;

  GetStorageUtil._internal();

  Future<void> init() async {
    _getStorage =  GetStorage();
  }
}