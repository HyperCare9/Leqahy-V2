import 'package:flutter/material.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';

cardIcon({dynamic size, String? text, String? img, required Function() onTap}) {
  return Column(
    children: [
      InkWell(
        onTap: onTap,
        child: InkWell(
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
                  child: Image.asset(
                    'assets/images/$img.png',
                    color: mainColor,
                    height: size.height * 0.03,
                  ),
                ),
              ),
            ))),
        // Container(
        //   margin: EdgeInsets.only(bottom: size.height * 0.01),
        //   height: size.height * 0.07,
        //   width: size.width * 0.14,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(12.0),
        //       gradient: const LinearGradient(
        //           begin: Alignment.bottomCenter,
        //           end: Alignment.topCenter,
        //           colors: [mainColor, mainColor])),
        //   child: Image.asset(
        //     img!,
        //     width: size.width * 0.10,
        //     color: whiteColor,
        //   ),
        // ),
      ),
      SizedBox(
        width: size.width * 0.20,
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
