import 'package:get/get.dart';
import 'package:pocket_dictionary/modules/searchhistory/controller/searchhistorycontroller.dart';
import 'package:pocket_dictionary/modules/searchresult/controller/searchresultcontroller.dart';
import 'package:pocket_dictionary/modules/searchresult/repo/searchrepo.dart';

class SearchHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchRepo>(() => SearchRepo());
    Get.lazyPut<SearchResultController>(() => SearchResultController());
    Get.lazyPut<SearchHistoryController>(() => SearchHistoryController());
  }

}