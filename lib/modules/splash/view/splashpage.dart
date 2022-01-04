import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pocket_dictionary/core/constants.dart';
import 'package:pocket_dictionary/core/style.dart';
import 'package:pocket_dictionary/modules/splash/controller/splashcontroller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<SplashController>();

    return Scaffold(
      backgroundColor: controller.getBackgroundColor(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(child: SvgPicture.asset(controller.getSplashLogo(context))),
          const Spacer(),
          Text(Constants.developedBy, style: Style.uppercaseTextStyle()),
          const SizedBox(height: 10),
          Text(Constants.authorName, style: Style.boldTextStyle(context)),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
