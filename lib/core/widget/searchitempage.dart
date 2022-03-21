import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_dictionary/core/apptheme.dart';
import 'package:pocket_dictionary/core/routes.dart';
import 'package:pocket_dictionary/core/style.dart';

import '../../modules/searchresult/model/searchresult.dart';

class SearchItemPage extends StatelessWidget {
  final SearchResult searchResult;
  const SearchItemPage({ required this.searchResult, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.searchResult, arguments: searchResult.word?.toLowerCase());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
              searchResult.word ?? "",
            style: Style.primaryTextStyle(context),
          ),
          const SizedBox(height: 8),
          Text(
            searchResult.meanings?[0].definitions?[0].definition ?? "",
            maxLines: 1,
            style: Style.secondaryTextStyle(context),
          ),
          const SizedBox(height: 10),
          Divider(
            thickness: 1,
            color: context.isDarkMode? AppTheme.dividerColor: AppTheme.tagColor,
          )
        ],
      ),
    );
  }
}
