import 'package:flutter/material.dart';
import 'package:pocket_dictionary/core/apptheme.dart';
import 'package:pocket_dictionary/core/style.dart';

class RecentSearchesItemPage extends StatelessWidget {
  const RecentSearchesItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Ambition",
          style: Style.primaryTextStyle(context),
        ),
        const SizedBox(height: 5),
        Text(
          "a strong desire to do or achieve something.",
          style: Style.secondaryTextStyle(context),
        ),
        const SizedBox(height: 3),
        const Divider(
          color: AppTheme.dividerColor,
        )
      ],
    );
  }
}
