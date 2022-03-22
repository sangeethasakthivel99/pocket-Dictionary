import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pocket_dictionary/core/apptheme.dart';
import 'package:pocket_dictionary/core/constants.dart';
import 'package:pocket_dictionary/core/imageutil.dart';
import 'package:pocket_dictionary/core/routes.dart';
import 'package:pocket_dictionary/core/style.dart';
import 'package:pocket_dictionary/modules/home/controller/homecontroller.dart';
import 'package:pocket_dictionary/core/widget/searchitempage.dart';
import '../../../core/widget/emptywidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return Scaffold(
        backgroundColor: context.isDarkMode ? AppTheme.black : AppTheme.white,
        appBar: AppBar(
          backgroundColor: context.isDarkMode ? AppTheme.black : AppTheme.white,
          title: context.isDarkMode
              ? SvgPicture.asset(ImageUtil.appLogoDark)
              : SvgPicture.asset(ImageUtil.appLogoLight),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.bookmark);
                },
                icon: const Icon(
                  CupertinoIcons.bookmark_fill,
                  color: AppTheme.primaryColor,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Obx(
                    () => Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Form(
                            key: controller.formKey,
                            child: TextFormField(
                              controller: controller.searchTextController,
                              autofocus: false,
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  controller.isSearchEnabled.value = false;
                                } else {
                                  controller.isSearchEnabled.value = true;
                                }
                              },
                              validator: (value) {
                                return controller.validateSearchField();
                              },
                              decoration: Style.roundedTextFieldStyle(
                                  context,
                                  Constants.search,
                                  Constants.search,
                                  CupertinoIcons.search),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: controller.isSearchEnabled.value &&
                              controller.searchTextController.text.isNotEmpty,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: IconButton(
                              icon: const Icon(
                                CupertinoIcons.arrow_right_circle_fill,
                                color: AppTheme.primaryColor,
                              ),
                              onPressed: () {
                                Get.toNamed(Routes.searchResult,
                                    arguments:
                                        controller.searchTextController.text);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        Constants.recentSearches,
                        style: Style.primaryTitleStyle(),
                      )),
                  const SizedBox(height: 20),
                  Obx(() {
                    if (controller.searchResultResponse.value.responseStatus ==
                        Constants.success) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: (controller.searchHistory.length > 5)
                              ? 5
                              : controller.searchHistory.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SearchItemPage(
                                searchResult: controller.searchHistory[index]);
                          });
                    } else if (controller
                            .searchResultResponse.value.responseStatus ==
                        Constants.empty) {
                      return const EmptyWidget(
                          imagePath: ImageUtil.emptySearch,
                          emptyTitle: "No Words Searched");
                    } else if (controller
                            .searchResultResponse.value.responseStatus ==
                        Constants.loading) {
                      return const Center(
                          child: SpinKitCircle(
                        color: AppTheme.primaryColor,
                        size: 60,
                      ));
                    }
                    return Container();
                  }),
                  const SizedBox(height: 20),
                  Obx(
                    () => Visibility(
                      visible: controller.isViewAllEnabled.value,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.searchHistory);
                        },
                        child: Container(
                          width: 160,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: AppTheme.tagColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                              child: Text(
                            Constants.viewAll,
                            style: Style.greenTextStyle(),
                          )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
