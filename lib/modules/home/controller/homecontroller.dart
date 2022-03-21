import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/db/SearchResultEntity.dart';
import '../../../core/db/pocketdictionardatabase.dart';
import '../../searchresult/model/searchresult.dart';

class HomeController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController searchTextController;
  var searchHistory = List<SearchResult>.empty(growable: true).obs;
  RxBool isSearchEnabled = false.obs;
  RxBool isViewAllEnabled = false.obs;

  @override
  void onInit() {
    searchTextController = TextEditingController();
    fetchBookmarksFromDB();
    super.onInit();
  }

  fetchBookmarksFromDB() async{
    try {
      List<SearchResultEntity> data = await PocketDictionaryDatabase.instance.getAllSearchHistory();
      if(data.isNotEmpty) {
        isViewAllEnabled.value = true;
      }
      for (var element in data) {
        searchHistory.addAll(searchResponseFromJson(element.data ?? ""));
      }
    } catch(e) {
      isViewAllEnabled.value = false;
    }
  }

  validateSearchField() {
    if(searchTextController.text.isEmpty) {
      return "Search text can not be empty";
    }
    return null;
  }

  @override
  void onClose() {
    searchTextController.dispose();
    super.onClose();
  }
}