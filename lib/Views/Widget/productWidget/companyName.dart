import 'package:flutter/material.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';

companyName({dynamic size, String? companyName}) {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: size.width * 0.04,
    ),
    decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: mainColor))),
    child: Text(
      companyName!,
      style: MyTheme.lightTheme.textTheme.bodyText2,
    ),
  );
}
