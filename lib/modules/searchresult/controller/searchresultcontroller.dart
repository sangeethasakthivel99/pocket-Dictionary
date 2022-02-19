import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:pocket_dictionary/core/constants.dart';
import 'package:pocket_dictionary/modules/searchresult/model/searchresult.dart';
import 'package:pocket_dictionary/modules/searchresult/repo/searchrepo.dart';
import 'package:pocket_dictionary/service/networkerror.dart';

class SearchResultController extends GetxController {

  var searchResponse = ResponseInfo(responseStatus: Constants.loading).obs;
  RxString searchKey = Constants.emptyString.obs;
  var searchRepo = Get.find<SearchRepo>();
  var searchResult = List<SearchResult>.empty(growable: true).obs;
  var isNetworkConnected = true.obs;

  @override
  void onInit() {
    searchKey(Get.arguments);
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

  checkNetWorkConnectivity() {
    (Connectivity().checkConnectivity()).then((connectivityResult) {
      if(connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
        isNetworkConnected.value = true;
      } else {
        isNetworkConnected.value = false;
      }
    });
  }

  fetchResult() async {
    searchResponse.value = ResponseInfo(responseStatus: Constants.loading);
    var result = await searchRepo.getResult(searchKey.value);
    try {
      if(result.error == null) {
        var response = searchResponseFromJson(result.response);
        searchResult.value = response;
        searchResponse.value = ResponseInfo(
            responseStatus: Constants.success,
            respCode: 200,
            respMessage: "success");
      } else {
        print(result.error);
        searchResponse.value = ResponseInfo(
            responseStatus: Constants.error,
            respCode: 400,
            respMessage: "Unable to find the meaning for ${searchKey.value}");
      }
    } catch(e) {
      print(e);
      searchResponse.value = ResponseInfo(
          responseStatus: Constants.error,
          respCode: 400,
          respMessage: "Unable to find the meaning for ${searchKey.value}");
    }
  }
}