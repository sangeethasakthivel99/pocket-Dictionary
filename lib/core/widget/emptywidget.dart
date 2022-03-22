import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocket_dictionary/core/style.dart';

class EmptyWidget extends StatelessWidget {
  final String imagePath;
  final String emptyTitle;

  const EmptyWidget(
      {required this.imagePath, required this.emptyTitle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: SvgPicture.asset(imagePath),
          ),
          const SizedBox(height: 40),
          Text(emptyTitle, style: Style.boldTextStyle(context))
        ],
      ),
    );
  }
}
