import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_dictionary/core/apptheme.dart';
import 'package:pocket_dictionary/core/style.dart';

import '../model/searchresult.dart';

class MeaningItem extends StatelessWidget {
  Meaning meaning;

  MeaningItem({required this.meaning, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Text(
          meaning.partOfSpeech ?? "",
          style: Style.boldTextStyle(context),
        ),
        const SizedBox(height: 20),
        ListView.builder(
            shrinkWrap: true,
            itemCount: meaning.definitions?.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppTheme.primaryColor),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                        child: Text(
                            meaning.definitions?[index].definition ?? "",
                          style: Style.secondaryTextStyle(context),
                        )
                    )
                  ],
                ),
              );
            })
      ],
    );
  }
}
