import 'dart:io';
import 'package:get/get.dart';
import 'package:pocket_dictionary/core/constants.dart';
import 'package:pocket_dictionary/service/apiresponse.dart';
import 'package:http/http.dart' as http;

import '../model/searchresult.dart';

class SearchRepo extends GetConnect {

  @override
  void onInit() {
    httpClient.timeout=const Duration(seconds: 15);
    super.onInit();
  }

  Future<ApiResponse> getResult(String key) async {
    try {
      var result = await http.get(Uri.parse(Constants.baseUrl+key));
      print(result.body);
      return ApiResponse.success(searchResponseFromJson(result.body));
    } on SocketException {
      return ApiResponse.error("No Internet");
    }
    on HttpException {
      return ApiResponse.error("Server error");
    }
    on FormatException {
      return ApiResponse.error('Invalid response');
    }
    catch (e) {
      return ApiResponse.error('Unknown error occurred');
    }
  }
}
