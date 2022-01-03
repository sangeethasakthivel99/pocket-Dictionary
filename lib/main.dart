import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_dictionary/modules/splash/view/splashpage.dart';
import 'core/apptheme.dart';
import 'core/storageservice.dart';
import 'modules/splash/binding/splashbinding.dart';

void main() {
  initialConfig();
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
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashPage(), binding: SplashBinding()),
      ],
    );
  }
}

Future<void> initialConfig() async {
  await Get.putAsync(() => StorageService().init());
}
