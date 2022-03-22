import 'package:get/get.dart';
import '../../../core/constants.dart';
import '../../../core/db/SearchResultEntity.dart';
import '../../../core/db/pocketdictionardatabase.dart';
import '../../../service/networkerror.dart';
import '../../searchresult/model/searchresult.dart';

class SearchHistoryController extends GetxController {
  var searchHistoryResponse = ResponseInfo(responseStatus: Constants.loading).obs;
  var searchHistory = List<SearchResult>.empty(growable: true).obs;

  @override
  void onInit() {
    fetchBookmarksFromDB();
    super.onInit();
  }

  fetchBookmarksFromDB() async{
    try {
      List<SearchResultEntity> data = await PocketDictionaryDatabase.instance.getAllSearchHistory();
      for (var element in data) {
        searchHistory.addAll(searchResponseFromJson(element.data ?? ""));
      }
      searchHistory.value = searchHistory.reversed.toList();
      searchHistoryResponse.value = ResponseInfo(responseStatus: Constants.success);
    } catch(e) {
      searchHistoryResponse.value = ResponseInfo(responseStatus: Constants.error);
    }
  }
}