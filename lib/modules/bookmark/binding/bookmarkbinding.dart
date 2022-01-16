import 'package:get/get.dart';
import 'package:pocket_dictionary/modules/bookmark/controller/bookmarkcontroller.dart';
import 'package:pocket_dictionary/modules/searchresult/controller/searchresultcontroller.dart';

class BookmarkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchResultController>(() => SearchResultController());
    Get.lazyPut<BookmarkController>(() => BookmarkController());
  }

}