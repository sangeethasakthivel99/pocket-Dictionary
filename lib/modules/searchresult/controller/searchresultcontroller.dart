import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:pocket_dictionary/core/constants.dart';
import 'package:pocket_dictionary/core/db/SearchResultEntity.dart';
import 'package:pocket_dictionary/core/db/pocketdictionardatabase.dart';
import 'package:pocket_dictionary/modules/searchresult/model/searchresult.dart';
import 'package:pocket_dictionary/modules/searchresult/repo/searchrepo.dart';
import 'package:pocket_dictionary/service/networkerror.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SearchResultController extends GetxController {

  var searchResponse = ResponseInfo(responseStatus: Constants.loading).obs;
  RxString searchKey = Constants.emptyString.obs;
  var searchRepo = Get.find<SearchRepo>();
  var searchResult = List<SearchResult>.empty(growable: true).obs;
  var isNetworkConnected = true.obs;
  var isBookmarked = false.obs;

  @override
  void onInit() {
    searchKey(Get.arguments);
    isBookMarked();
    checkNetWorkConnectivity();
    if(isNetworkConnected.isTrue) {
      fetchResult();
    } else {
      searchResponse.value = ResponseInfo(
          responseStatus: Constants.noInternet,
          respMessage: "No Internet");
    }
    super.onInit();
  }

  isBookMarked() async{
    var key = searchKey.toLowerCase();
    List<SearchResultEntity> data = await PocketDictionaryDatabase.instance.getBookmark(key);
    if(data.isNotEmpty) {
      isBookmarked.value = true;
    } else {
      isBookmarked.value = false;
    }
  }

  checkNetWorkConnectivity() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      isNetworkConnected.value = true;
    } else{
      isNetworkConnected.value = false;
    }
  }

  fetchResult() async {
    searchResponse.value = ResponseInfo(responseStatus: Constants.loading);
    if(await isAvailableInDB()) {
      var key = searchKey.toLowerCase();
      List<SearchResultEntity> result = await PocketDictionaryDatabase.instance.getBookmark(key);
      searchResult.clear();
      searchResult.addAll(searchResponseFromJson(result[0].data ?? ""));
      searchResponse.value = ResponseInfo(
          responseStatus: Constants.success,
          respCode: 200,
          respMessage: "success");
    } else {
      var result = await searchRepo.getResult(searchKey.value);
      try {
        if(result.error == null) {
          var response = result.response;
          searchResult.clear();
          searchResult.value = response;
          saveSearchResultToDb();
          searchResponse.value = ResponseInfo(
              responseStatus: Constants.success,
              respCode: 200,
              respMessage: "success");
        } else {
          searchResponse.value = ResponseInfo(
              responseStatus: Constants.error,
              respCode: 400,
              respMessage: "Unable to find the meaning for ${searchKey.value}");
        }
      } catch(e) {
        searchResponse.value = ResponseInfo(
            responseStatus: Constants.error,
            respCode: 400,
            respMessage: "Unable to find the meaning for ${searchKey.value}");
      }
    }
  }

  isAvailableInDB() async {
    var key = searchKey.toLowerCase();
    List<SearchResultEntity> bookmark = await PocketDictionaryDatabase.instance.getBookmark(key);
    if(bookmark.isNotEmpty) {
      return true;
    }
    return false;
  }

  saveSearchResultToDb() {
    var key = searchKey.toLowerCase();
    var data = jsonEncode(searchResult);
    var entityData = SearchResultEntity(key: key, data: data);
    PocketDictionaryDatabase.instance.addToRecent(entityData);
  }

  addToBookmark() async{
    var key = searchKey.toLowerCase();
    var data = jsonEncode(searchResult);
    var entityData = SearchResultEntity(key: key, data: data);
    await PocketDictionaryDatabase.instance.addToBookmarks(entityData);
    isBookMarked();
  }

  removeFromBookmark() async{
    var key = searchKey.toLowerCase();
    var data = await PocketDictionaryDatabase.instance.removeFromBookmark(key);
    if(data == 1) {
      isBookmarked.value = false;
    }
  }

  playPronunciation() async {
    AudioPlayer audioPlayer = AudioPlayer();
    if(searchResult.isNotEmpty) {
      await audioPlayer.play(searchResult[0].phonetics[0].audio);
    }
  }
}