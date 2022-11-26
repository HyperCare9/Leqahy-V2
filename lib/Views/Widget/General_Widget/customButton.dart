import 'package:flutter/material.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';

customBotton({dynamic size, String? text, Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: size.height * 0.07,
      width: size.width * 0.85,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Center(
          child: Text(
        text!,
        style: MyTheme.lightTheme.textTheme.headline2,
      )),
    ),
  );
}
