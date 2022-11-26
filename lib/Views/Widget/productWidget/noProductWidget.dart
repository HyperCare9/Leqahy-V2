import 'package:flutter/material.dart';

import '../../../Constant/theme.dart';

noCompanyWidget({String? message}) {
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
          message!,
          style: MyTheme.lightTheme.textTheme.subtitle1,
        ),
      ],
    ),
  );
}
