import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

buildcustomHeader(
    {dynamic size,
    IconData? preIcon,
    IconData? sufIcon,
    required BuildContext context,
    Function()? preFun,
    Function()? sufFun,
    Color? preColor,
    Color? sufColor}) {
  return Container(
    height: size.height * 0.09,
    margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
    child: Row(
      children: [
        IconButton(
          onPressed: preFun,
          icon: Icon(
            preIcon,
            size: 25,
            color: preColor,
          ),
        ),
        Expanded(
            child: Image.asset(
          context.locale == const Locale('en', 'US')
              ? 'assets/images/logo.png'
              : 'assets/images/Logo_Ar.png',
          // color: mainColor,
          height: size.height * 0.07,
        )),
        IconButton(
          onPressed: sufFun,
          icon: Icon(
            sufIcon,
            size: 25,
            color: sufColor,
          ),
        ),
      ],
    ),
  );
}
