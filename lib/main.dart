import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_dictionary/modules/splash/view/splashpage.dart';
import 'core/apptheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pocket Dictionary',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const SplashPage(),
    );
  }
}
