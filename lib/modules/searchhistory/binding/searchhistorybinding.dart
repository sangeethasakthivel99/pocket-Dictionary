import 'package:get/get.dart';
import 'package:pocket_dictionary/modules/searchhistory/controller/searchhistorycontroller.dart';

class SearchHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchHistoryController>(() => SearchHistoryController());
  }

}