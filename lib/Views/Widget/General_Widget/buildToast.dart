import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Constant/colors.dart';

import '../../../Constant/theme.dart';

buildToast(
    {String? message, Color? colors, IconData? icon, Function()? onPressed}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    decoration:
        BoxDecoration(color: colors, borderRadius: BorderRadius.circular(25.0)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 12.0),
        Expanded(
          child: Text(
            message!,
            style: MyTheme.lightTheme.textTheme.subtitle1!
                .copyWith(color: whiteColor),
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
        const SizedBox(width: 12.0),
      ],
    ),
  );
}

showBottomToast(
    {FToast? toast,
    String? message,
    Color? colors,
    IconData? icon,
    Function()? onPressed}) {
  toast!.showToast(
      gravity: ToastGravity.BOTTOM,
      child: buildToast(
          message: message, colors: colors, icon: icon, onPressed: onPressed));
}
