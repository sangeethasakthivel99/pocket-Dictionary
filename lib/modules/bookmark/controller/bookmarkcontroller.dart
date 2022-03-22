import 'package:get/get.dart';
import '../../../core/constants.dart';
import '../../../core/db/SearchResultEntity.dart';
import '../../../core/db/pocketdictionardatabase.dart';
import '../../../service/networkerror.dart';
import '../../searchresult/model/searchresult.dart';

class BookmarkController extends GetxController {
  var bookmarkResponse = ResponseInfo(responseStatus: Constants.loading).obs;
  var bookmarks = List<SearchResult>.empty(growable: true).obs;

  @override
  void onInit() {
    fetchBookmarksFromDB();
    super.onInit();
  }

  fetchBookmarksFromDB() async {
    try {
      List<SearchResultEntity> data =
          await PocketDictionaryDatabase.instance.getAllBookmarks();
      for (var element in data) {
        bookmarks.addAll(searchResponseFromJson(element.data ?? ""));
      }
      bookmarks.value = bookmarks.reversed.toList();
      if (bookmarks.isEmpty) {
        bookmarkResponse.value = ResponseInfo(responseStatus: Constants.empty);
      } else {
        bookmarkResponse.value = ResponseInfo(responseStatus: Constants.success);
      }
    } catch (e) {
      bookmarkResponse.value = ResponseInfo(responseStatus: Constants.error);
    }
  }
}
