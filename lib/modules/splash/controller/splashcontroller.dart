import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pocket_dictionary/core/apptheme.dart';
import 'package:pocket_dictionary/core/imageutil.dart';
import 'package:pocket_dictionary/core/routes.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offAndToNamed(Routes.home);
    });
    super.onInit();
  }

  String getSplashLogo(BuildContext context) {
    return context.isDarkMode ? ImageUtil.splashLogoDark : ImageUtil.splashLogoLight;
  }

  Color getBackgroundColor(BuildContext context) {
    return context.isDarkMode? AppTheme.black : AppTheme.whiteBackground;
  }
}