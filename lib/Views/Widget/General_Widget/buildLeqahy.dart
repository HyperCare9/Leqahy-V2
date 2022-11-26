import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../Constant/theme.dart';

buildLeqahy({dynamic size, Function()? onTap}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04, vertical: size.height * 0.02),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
            Text(
              'Back'.tr(),
              style: MyTheme.lightTheme.textTheme.bodyText2!
                  .copyWith(color: Colors.black),
            )
          ],
        ),
        Image.asset(
          'assets/images/logo.png',
          height: size.height * 0.10,
          width: size.width * 0.18,
          fit: BoxFit.fill,
        )
      ],
    ),
  );
}
