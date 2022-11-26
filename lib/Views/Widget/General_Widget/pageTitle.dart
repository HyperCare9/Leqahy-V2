import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';

pageTitle({dynamic size, String? text, required BuildContext context}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
    padding: EdgeInsets.symmetric(horizontal: size.width * 0.015),
    decoration: BoxDecoration(
      border: context.locale == const Locale('en', 'US')
          ? Border(left: BorderSide(color: Colors.grey[500]!, width: 8.0))
          : Border(right: BorderSide(color: Colors.grey[500]!, width: 8.0)),
    ),
    child: Text(
      text!,
      style: MyTheme.lightTheme.textTheme.headline2!.copyWith(color: mainColor),
    ),
  );
}
