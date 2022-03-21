import 'dart:convert';

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

  fetchBookmarksFromDB() async{
    try {
      List<SearchResultEntity> data = await PocketDictionaryDatabase.instance.getAllBookmarks();
      for (var element in data) {
        bookmarks.addAll(searchResponseFromJson(element.data ?? ""));
      }
      bookmarkResponse.value = ResponseInfo(responseStatus: Constants.success);
    } catch(e) {
      bookmarkResponse.value = ResponseInfo(responseStatus: Constants.error);
    }
  }
}