import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {

  Future<StorageService> init() async {
    await GetStorage.init();
    return this;
  }

  Future<void> write(String key, dynamic value) async{
    await GetStorage().write(key, value);
  }

  Future<dynamic> read(String key) async {
    String? userId = GetStorage().read(key);
    return userId;
  }

}