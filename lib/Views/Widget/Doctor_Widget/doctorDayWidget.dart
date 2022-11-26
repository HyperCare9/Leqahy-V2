import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../Constant/colors.dart';

import '../../../Constant/theme.dart';

doctorMorningDayTime({dynamic size}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Icon(
              Icons.light_mode,
              color: Colors.amber,
              size: 25,
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Text(
              'Morning'.tr(),
              style: MyTheme.lightTheme.textTheme.subtitle1,
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.015,
        ),
        Wrap(
          children: [
            customTime(time: '10:00 Am', isOFF: false),
            customTime(time: '10:30 Am', isOFF: false),
            customTime(time: '11:00 Am', isOFF: true),
            customTime(time: '11:30 Am', isOFF: false),
            customTime(time: '12:00 Am', isOFF: true),
          ],
        )
      ],
    ),
  );
}

doctorEviningDayTime({dynamic size}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Icon(
              Icons.dark_mode,
              size: 25,
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Text(
              'Evening'.tr(),
              style: MyTheme.lightTheme.textTheme.subtitle1,
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.015,
        ),
        Wrap(
          children: [
            customTime(time: '12:30 Pm', isOFF: false),
            customTime(time: '01:00 Pm', isOFF: false),
            customTime(time: '01:30 Pm', isOFF: true),
            customTime(time: '02:00 Pm', isOFF: false),
            customTime(time: '02:30 Pm', isOFF: true),
            customTime(time: '03:00 Pm', isOFF: false),
          ],
        )
      ],
    ),
  );
}

customTime({String? time, bool? isOFF}) {
  return Container(
    padding: const EdgeInsets.all(5.0),
    margin: const EdgeInsets.only(right: 10.0, top: 10.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: isOFF == false ? whiteColor : Colors.red,
        border: Border.all(color: isOFF == false ? mainColor : whiteColor)),
    child: Text(
      time!,
      style: isOFF == false
          ? MyTheme.lightTheme.textTheme.subtitle2
          : MyTheme.lightTheme.textTheme.subtitle2!.copyWith(color: whiteColor),
    ),
  );
}
