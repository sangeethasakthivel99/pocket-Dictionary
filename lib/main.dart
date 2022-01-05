import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_dictionary/modules/bookmark/binding/bookmarkbinding.dart';
import 'package:pocket_dictionary/modules/bookmark/view/bookmarkpage.dart';
import 'package:pocket_dictionary/modules/home/binding/homebinding.dart';
import 'package:pocket_dictionary/modules/home/view/homepage.dart';
import 'package:pocket_dictionary/modules/searchhistory/binding/searchhistorybinding.dart';
import 'package:pocket_dictionary/modules/searchhistory/view/searchhistorypage.dart';
import 'package:pocket_dictionary/modules/splash/view/splashpage.dart';
import 'core/apptheme.dart';
import 'core/routes.dart';
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
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      getPages: [
        GetPage(name: Routes.splash, page: () => const SplashPage(), binding: SplashBinding()),
        GetPage(name: Routes.home, page: () => const HomePage(), binding: HomeBinding()),
        GetPage(name: Routes.searchHistory, page: () => const SearchHistoryPage(), binding: SearchHistoryBinding()),
        GetPage(name: Routes.bookmark, page: () => const BookmarkPage(), binding: BookmarkBinding()),
      ],
    );
  }
}

Future<void> initialConfig() async {
  await Get.putAsync(() => StorageService().init());
}
