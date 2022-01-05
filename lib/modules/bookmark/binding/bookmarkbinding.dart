import 'package:get/get.dart';
import 'package:pocket_dictionary/modules/bookmark/controller/bookmarkcontroller.dart';

class BookmarkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookmarkController>(() => BookmarkController());
  }

}