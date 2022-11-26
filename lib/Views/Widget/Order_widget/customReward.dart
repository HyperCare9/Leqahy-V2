import 'package:flutter/material.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';

cusReward({dynamic size, String? title, String? content}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Text(title!,
              style: MyTheme.lightTheme.textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.grey[500])),
        ),
        SizedBox(
          width: double.infinity,
          child: Card(
            color: lightGrey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(content!,
                  style: MyTheme.lightTheme.textTheme.subtitle1!
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
        )
      ],
    ),
  );
}
