import 'package:get/get.dart';
import 'package:pocket_dictionary/modules/searchresult/controller/searchresultcontroller.dart';

class SearchResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchResultController>(() => SearchResultController());
  }

}