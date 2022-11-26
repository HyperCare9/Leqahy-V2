import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';

cartTitel({dynamic size}) {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: size.width * 0.04,
    ),
    decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: mainColor))),
    child: Text(
      'Your Cart'.tr(),
      style: MyTheme.lightTheme.textTheme.bodyText2,
    ),
  );
}
