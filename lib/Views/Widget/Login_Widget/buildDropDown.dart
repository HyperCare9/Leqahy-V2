import 'package:flutter/material.dart';
import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';

buildDropDown(
    {String? text, List? items, Function(String?)? onChanged, String? value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text!,
        style: MyTheme.lightTheme.textTheme.headline2!
            .copyWith(color: Colors.black),
      ),
      const SizedBox(height: 5.0),
      DropdownButton<String>(
          isExpanded: true,
          value: value,
          items: items!.map((e) => buildMenuItem(e)).toList(),
          onChanged: onChanged)
    ],
  );
}

DropdownMenuItem<String> buildMenuItem(String item) {
  return DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style:
            MyTheme.lightTheme.textTheme.headline3!.copyWith(color: mainColor),
      ));
}
