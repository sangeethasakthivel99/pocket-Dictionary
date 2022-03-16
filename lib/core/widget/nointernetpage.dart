import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pocket_dictionary/core/imageutil.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            ImageUtil.noInternetLottie,
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
