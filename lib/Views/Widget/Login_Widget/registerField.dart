import 'package:flutter/material.dart';
import '../../../Constant/theme.dart';

registerField(
    {dynamic size,
    TextEditingController? controller,
    String? hint,
    String? Function(String?)? validator,
    bool? obscure}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04, vertical: size.height * 0.005),
    child: TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscure == true ? true : false,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.0),
          hintText: hint,
          hintStyle: MyTheme.lightTheme.textTheme.subtitle1!
              .copyWith(color: Colors.grey)),
    ),
  );
}
