import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pocket_dictionary/core/constants.dart';
import 'package:pocket_dictionary/core/imageutil.dart';
import 'package:pocket_dictionary/core/style.dart';
import 'package:pocket_dictionary/modules/home/controller/homecontroller.dart';
import 'package:pocket_dictionary/modules/home/view/recentsearchpage.dart';

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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SvgPicture.asset(ImageUtil.appLogoDark),
                const SizedBox(height: 40),
                Form(
                  key: controller.formKey,
                  child: TextFormField(
                    controller: controller.searchTextController,
                    autofocus: false,
                    validator: (value) {
                      return controller.validateSearchField();
                    },
                    decoration: Style.roundedTextFieldStyle(
                        "Search",
                        "Search",
                        CupertinoIcons.search),
                  ),
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.topLeft,
                    child: Text(
                        Constants.recentSearches,
                      style: Style.primaryTitleStyle(),
                    )
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return RecentSearchesItemPage();
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
