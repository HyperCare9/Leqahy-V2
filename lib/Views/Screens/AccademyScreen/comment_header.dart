import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../Constant/colors.dart';

import '../../../Constant/theme.dart';

commentHeader(
    {required BuildContext context,
    dynamic size,
    String? title,
    String? content}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[400],
          child: Text(
            title!,
            style: MyTheme.lightTheme.textTheme.headline2,
          ),
        ),
        SizedBox(width: size.width * 0.02),
        Expanded(
          child: Card(
            color: darkGrey,
            shape: context.locale == const Locale('en', 'US')
                ? const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        topRight: Radius.circular(16)))
                : const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(16))),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01, horizontal: size.width * 0.02),
              child: Text(
                content!,
                style: MyTheme.lightTheme.textTheme.subtitle1!
                    .copyWith(fontWeight: FontWeight.bold),
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
