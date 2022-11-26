import 'package:flutter/material.dart';

buttonCard({IconData? icon,Color? iconColor,double? iconSize,Function()? onTap}) {
  return Card(
    color: Colors.grey[100],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onTap,
        child: Icon(icon,color: iconColor,size: iconSize,)),
    ),
  );
}
