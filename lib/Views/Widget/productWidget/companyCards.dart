import 'package:flutter/material.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';

companyCard(
    {dynamic size,
    String? text,
    required Function() onTap,
    ImageProvider<Object>? backgroundImage}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      InkWell(
          onTap: onTap,
          child: Center(
              child: CircleAvatar(
            backgroundColor: whiteColor,
            maxRadius: 40,
            backgroundImage: const AssetImage('assets/images/logoMark.png'),
            child: CircleAvatar(
                maxRadius: 26,
                backgroundColor: whiteColor,
                backgroundImage: backgroundImage),
          ))),
      SizedBox(
        width: size.width * 0.30,
        child: Text(
          text!,
          style: MyTheme.lightTheme.textTheme.subtitle2!
              .copyWith(color: mainColor),
          softWrap: true,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.center,
        ),
      )
    ],
  );
}
