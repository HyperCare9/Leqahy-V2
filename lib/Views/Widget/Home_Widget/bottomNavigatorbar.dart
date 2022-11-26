import 'package:flutter/material.dart';

import '../../../Constant/colors.dart';

Widget customBottomBar({dynamic size}) {
  return Container(
    padding: EdgeInsets.only(bottom: size.height * 0.004),
    decoration: const BoxDecoration(
        // borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(50.0),
        //     bottomRight: Radius.circular(50.0)),
        // gradient: LinearGradient(
        //     begin: Alignment.bottomCenter,
        //     end: Alignment.topCenter,
        //     colors: [mainColor, mainColor]),
        ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            width: size.width * 0.90,
            child: const Divider(color: whiteColor, thickness: 2.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            customCard(icon: Icons.home, text: 'Home'),
            customCard(icon: Icons.shopping_cart, text: 'Categories'),
            customCard(icon: Icons.payment, text: 'Cart'),
            customCard(icon: Icons.settings, text: 'stock market'),
            customCard(icon: Icons.help, text: 'Profile'),
            customCard(icon: Icons.logout, text: 'Profile'),
          ],
        ),
      ],
    ),
  );
}

customCard({IconData? icon, String? text}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        size: 25,
        color: mainColor,
      ),
      // Text(
      //   text!,
      //   style:
      //       MyTheme.lightTheme.textTheme.subtitle2!.copyWith(color: mainColor),
      // )
    ],
  );
}
