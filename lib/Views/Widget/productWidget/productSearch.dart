import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';

productSearch({dynamic size, TextEditingController? searchController}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: size.width * 0.11),
    child: SizedBox(
      height: size.height * 0.06,
      child: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
            hintText: 'search'.tr(),
            hintStyle: MyTheme.lightTheme.textTheme.subtitle1!
                .copyWith(color: Colors.grey),
            prefixIcon: const Icon(
              Icons.search,
              color: mainColor,
              size: 25,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: mainColor,
                width: 3.0,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            )),
      ),
    ),
  );
}
