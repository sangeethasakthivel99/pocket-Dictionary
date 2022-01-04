import 'package:get/get.dart';
import 'package:pocket_dictionary/modules/home/controller/homecontroller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}