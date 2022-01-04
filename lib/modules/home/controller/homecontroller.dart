import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController searchTextController;

  @override
  void onInit() {
    searchTextController = TextEditingController();
    super.onInit();
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