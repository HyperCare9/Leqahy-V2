import 'package:flutter/material.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';
import '../General_Widget/buttonCard.dart';
import '../General_Widget/leqahy_logo.dart';

buildHomeHead(
    {dynamic size, Function()? onTap, required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buttonCard(
            icon: Icons.menu,
            iconSize: 20.0,
            iconColor: mainColor,
            onTap: onTap),
        Column(
          children: [
            leqahyLogo(context: context, logoColor: mainColor),
            Text('Leqahy',
                style: MyTheme.lightTheme.textTheme.headline1!
                    .copyWith(color: mainColor)),
          ],
        ),
        buttonCard(
            icon: Icons.notifications, iconSize: 20.0, iconColor: mainColor),
      ],
    ),
  );
}
