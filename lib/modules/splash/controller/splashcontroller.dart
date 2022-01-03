import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pocket_dictionary/core/imageutil.dart';

class SplashController extends GetxController {

  String getSplashLogo(BuildContext context) {
    return context.isDarkMode ? ImageUtil.splashLogoDark : ImageUtil.splashLogoLight;
  }
}