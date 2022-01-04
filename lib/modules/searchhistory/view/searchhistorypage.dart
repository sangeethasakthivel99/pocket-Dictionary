import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pocket_dictionary/core/apptheme.dart';
import 'package:pocket_dictionary/core/constants.dart';
import 'package:pocket_dictionary/core/imageutil.dart';
import 'package:pocket_dictionary/core/style.dart';
import 'package:pocket_dictionary/core/widget/searchitempage.dart';

class SearchHistoryPage extends StatelessWidget {
  const SearchHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDarkMode ? AppTheme.black : AppTheme.white,
      appBar: AppBar(
        leading: IconButton(
          color: context.isDarkMode ? AppTheme.white : AppTheme.black,
          icon: const Icon(CupertinoIcons.arrow_left),
          onPressed: () => Get.back(),
        ),
        backgroundColor: context.isDarkMode ? AppTheme.black : AppTheme.white,
        title: context.isDarkMode
            ? SvgPicture.asset(ImageUtil.appLogoDark)
            : SvgPicture.asset(ImageUtil.appLogoLight),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      Constants.searchHistory,
                      style: Style.primaryTitleStyle(),
                    )),
                const SizedBox(height: 20),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 15,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return const SearchItemPage();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
