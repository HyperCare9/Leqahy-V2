import 'package:flutter/material.dart';
import '../../../Constant/colors.dart';

cartButton({Function()? onTap, IconData? icon}) {
  return InkWell(
    onTap: onTap,
    child: Card(
      color: mainColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Icon(
          icon,
          size: 20,
          color: whiteColor,
        ),
      ),
    ),
  );
}
