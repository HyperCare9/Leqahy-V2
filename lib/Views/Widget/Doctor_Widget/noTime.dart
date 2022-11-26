import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../Constant/theme.dart';

noTime({dynamic size}) {
  return SizedBox(
    height: size.height * 0.09,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.timer_off_outlined,
          size: 20,
          color: Colors.red,
        ),
        SizedBox(width: size.width * 0.01),
        Text(
          'There are no appointments on this day'.tr(),
          style: MyTheme.lightTheme.textTheme.subtitle1!
              .copyWith(color: Colors.red),
        )
      ],
    ),
  );
}
