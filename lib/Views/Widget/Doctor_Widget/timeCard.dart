import 'package:flutter/material.dart';
import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';

Widget timeCard(
    {String? time,
    String? duration,
    dynamic size,
    bool? isSelected,
    Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Card(
      color: isSelected == true ? timeBlue : whiteColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: const BorderSide(color: timeBlue, width: 1.0)),
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.022, vertical: size.height * 0.007),
          child: RichText(
              text: TextSpan(
                  style: MyTheme.lightTheme.textTheme.subtitle1!.copyWith(
                      color: isSelected == true ? whiteColor : timeBlue,
                      fontWeight: FontWeight.bold),
                  children: [TextSpan(text: time), TextSpan(text: duration)]))),
    ),
  );
}
