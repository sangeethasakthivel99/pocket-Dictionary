import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocket_dictionary/core/constants.dart';
import 'package:pocket_dictionary/core/imageutil.dart';
import 'package:pocket_dictionary/core/style.dart';
import 'package:pocket_dictionary/modules/splash/controller/splashcontroller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Spacer(),
          Center(child: SvgPicture.asset(SplashController().getSplashLogo())),
          const Spacer(),
          Text(Constants.developedBy, style: Style.uppercaseTextStyle()),
          const SizedBox(height: 10),
          Text(Constants.authorName, style: Style.boldTextStyle()),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
