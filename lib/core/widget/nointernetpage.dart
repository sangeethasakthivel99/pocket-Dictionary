import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pocket_dictionary/core/imageutil.dart';
import 'package:pocket_dictionary/core/style.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Lottie.asset(
              ImageUtil.noInternetLottie,
              width: double.infinity,
              height: 400,
              fit: BoxFit.fill,
            ),
          ),
          Text("No Internet Connection", style: Style.boldTextStyle(context))
        ],
      ),
    );
  }
}
