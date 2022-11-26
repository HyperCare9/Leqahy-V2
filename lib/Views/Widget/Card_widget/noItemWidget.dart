import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../Constant/theme.dart';

noCartItem() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          color: Colors.red,
          size: 40,
        ),
        const SizedBox(height: 7.0),
        Text(
          'There is no item in your cart'.tr(),
          style: MyTheme.lightTheme.textTheme.subtitle1,
        ),
      ],
    ),
  );
}
