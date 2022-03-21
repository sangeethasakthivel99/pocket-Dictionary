import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pocket_dictionary/core/apptheme.dart';
import 'package:pocket_dictionary/core/constants.dart';
import 'package:pocket_dictionary/core/imageutil.dart';
import 'package:pocket_dictionary/core/style.dart';
import 'package:pocket_dictionary/core/widget/searchitempage.dart';
import '../controller/bookmarkcontroller.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<BookmarkController>();
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
          if (controller.bookmarkResponse.value.responseStatus ==
              Constants.loading) {
            return const Center(
                child: SpinKitCircle(
              color: AppTheme.primaryColor,
              size: 60,
            ));
          } else if (controller.bookmarkResponse.value.responseStatus ==
              Constants.success) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            Constants.bookmarks,
                            style: Style.primaryTitleStyle(),
                          )),
                      const SizedBox(height: 20),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.bookmarks.length,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return SearchItemPage(searchResult: controller.bookmarks[index]);
                          }),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        }));
  }
}
