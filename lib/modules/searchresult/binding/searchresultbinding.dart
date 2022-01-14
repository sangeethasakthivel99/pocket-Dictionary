import 'package:get/get.dart';
import 'package:pocket_dictionary/modules/searchresult/controller/searchresultcontroller.dart';
import 'package:pocket_dictionary/modules/searchresult/repo/searchrepo.dart';

class SearchResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchRepo>(() => SearchRepo());
    Get.lazyPut<SearchResultController>(() => SearchResultController());
  }

}