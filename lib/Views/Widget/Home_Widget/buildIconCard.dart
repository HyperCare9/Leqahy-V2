import 'package:flutter/material.dart';
import '../../../Constant/colors.dart';

import '../../../Constant/theme.dart';

buildLeqahyIconCard(
    {dynamic size, String? img, String? text, required Function() onTap}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      InkWell(
          onTap: onTap,
          child: Center(
              child: CircleAvatar(
            backgroundColor: whiteColor,
            maxRadius: 35,
            backgroundImage: const AssetImage('assets/images/logoMark.png'),
            child: CircleAvatar(
              maxRadius: 23,
              backgroundColor: whiteColor,
              child: Center(
                child: Image.network(
                  img!,
                  color: mainColor,
                  height: size.height * 0.03,
                ),
              ),
            ),
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
