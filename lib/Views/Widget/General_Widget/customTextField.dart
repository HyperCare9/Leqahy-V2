import 'package:flutter/material.dart';

customTextField({TextEditingController? controller,String? hintText,Function()? onPressed,IconData? icon,double? iconSize,Function(String)? onChanged}) {
  return TextField(
    controller: controller,
    onChanged: onChanged,
    decoration: InputDecoration(
      hintText: hintText,
      suffixIcon: IconButton(
        onPressed: onPressed,
         icon: Icon(icon,size: iconSize,))
    ),
  );
}
