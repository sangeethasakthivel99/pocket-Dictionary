import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pocket_dictionary/core/apptheme.dart';
import 'package:pocket_dictionary/core/constants.dart';
import 'package:pocket_dictionary/core/imageutil.dart';
import 'package:pocket_dictionary/core/style.dart';
import 'package:pocket_dictionary/core/widget/nointernetpage.dart';
import 'package:pocket_dictionary/modules/searchresult/controller/searchresultcontroller.dart';
import 'package:pocket_dictionary/modules/searchresult/view/meaningitem.dart';

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
        if (controller.searchResponse.value.responseStatus ==
            Constants.loading) {
          return const Center(
              child: SpinKitCircle(
            color: AppTheme.primaryColor,
            size: 60,
          ));
        } else if (controller.searchResponse.value.responseStatus ==
            Constants.success) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(controller.searchResult[0].word ?? "",
                              style: Style.headingStyle()),
                          const SizedBox(height: 5),
                          Text(controller.searchResult[0].phonetics[0].text ?? controller.searchResult[0].word ?? "",
                              style: Style.secondaryTextStyle(context))
                        ],
                      ),
                      const Spacer(),
                      Obx(
                        () => IconButton(
                            onPressed: () async{
                              if(controller.isBookmarked.value) {
                                controller.removeFromBookmark();
                              } else {
                                controller.addToBookmark();
                              }
                            },
                            icon: (controller.isBookmarked.value)
                                ? const Icon(Icons.bookmark,
                                    color: AppTheme.primaryColor)
                                : const Icon(Icons.bookmark_outline_outlined)),
                      ),
                      IconButton(
                          onPressed: () {
                            controller.playPronunciation();
                          },
                          icon: SvgPicture.asset(ImageUtil.speaker)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: controller.searchResult[0].meanings?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MeaningItem(
                          meaning: controller.searchResult[0].meanings![index],
                        );
                      })
                ],
              ),
            ),
          );
        } else if (controller.searchResponse.value.responseStatus ==
            Constants.loading) {
          return const NoInternetPage();
        }
        return Container();
      }),
    );
  }
}
