import 'package:flutter/material.dart';
import '../../../Constant/colors.dart';

import '../../../Constant/theme.dart';

cusEditRow(
    {dynamic size,
    String? title,
    TextEditingController? controller,
    String? Function(String?)? validator,
    bool? isSuffix,
    Function()? onSuffixTap,
    String? hint}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: Text(
          title!,
          style: MyTheme.lightTheme.textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(height: size.height * 0.01),
      SizedBox(
        height: size.height * 0.05,
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
              hintText: hint,
              hintStyle: MyTheme.lightTheme.textTheme.subtitle1!
                  .copyWith(color: Colors.grey),
              suffixIcon: isSuffix == true
                  ? InkWell(
                      onTap: onSuffixTap,
                      child: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: mainColor,
                      ))
                  : null,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              )),
        ),
      ),
      SizedBox(
        height: size.height * 0.015,
      )
    ],
  );
}
