import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pocket_dictionary/core/apptheme.dart';
import 'package:pocket_dictionary/core/constants.dart';
import 'package:pocket_dictionary/core/imageutil.dart';
import 'package:pocket_dictionary/modules/searchresult/controller/searchresultcontroller.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<SearchResultController>();

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
      body: Obx(() {
        if(controller.searchResponse.value.responseStatus == Constants.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      }),
    );
  }
}
