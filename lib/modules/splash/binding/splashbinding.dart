import 'package:get/get.dart';
import 'package:pocket_dictionary/core/storageservice.dart';
import 'package:pocket_dictionary/modules/splash/controller/splashcontroller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StorageService>(() => StorageService());
    Get.lazyPut<SplashController>(() => SplashController());
  }

}