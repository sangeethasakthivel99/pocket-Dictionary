import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pocket_dictionary/core/apptheme.dart';
import 'package:pocket_dictionary/core/constants.dart';
import 'package:pocket_dictionary/core/imageutil.dart';
import 'package:pocket_dictionary/core/routes.dart';
import 'package:pocket_dictionary/core/style.dart';
import 'package:pocket_dictionary/modules/home/controller/homecontroller.dart';
import 'package:pocket_dictionary/core/widget/searchitempage.dart';

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
                              }
                              controller.isSearchEnabled.value = true;
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
                        visible: controller.isSearchEnabled.value && controller.searchTextController.text.isNotEmpty,
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
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return const SearchItemPage();
                    }),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.searchHistory);
                  },
                  child: Container(
                    width: 160,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: AppTheme.tagColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                        child: Text(
                      Constants.viewAll,
                      style: Style.greenTextStyle(),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
