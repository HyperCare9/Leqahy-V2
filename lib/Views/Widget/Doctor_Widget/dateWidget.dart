import 'package:flutter/material.dart';
import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';

bookDateWidget({dynamic size}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
    height: size.height * 0.11,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Icon(
              Icons.date_range,
              color: mainColor,
              size: 25,
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Text(
              'August 2022',
              style: MyTheme.lightTheme.textTheme.subtitle1,
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.015,
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              customDate(size: size, date: '06', day: 'Sat', isOFF: false),
              customDate(size: size, date: '07', day: 'Sun', isOFF: false),
              customDate(size: size, date: '08', day: 'Mon', isOFF: false),
              customDate(size: size, date: '09', day: 'Tue', isOFF: false),
              customDate(size: size, date: '10', day: 'Wed', isOFF: false),
              customDate(size: size, date: '11', day: 'Thur', isOFF: false),
              customDate(size: size, date: '12', day: 'Fri', isOFF: true),
            ],
          ),
        )
      ],
    ),
  );
}

customDate({dynamic size, String? day, String? date, bool? isOFF}) {
  return Container(
    width: size.width * 0.12,
    margin: EdgeInsets.only(right: size.height * 0.01),
    decoration: BoxDecoration(
        border: isOFF == false
            ? Border.all(color: mainColor)
            : Border.all(color: whiteColor),
        color: isOFF == false ? whiteColor : Colors.red,
        borderRadius: BorderRadius.circular(6.0)),
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            day!,
            style: isOFF == false
                ? MyTheme.lightTheme.textTheme.subtitle2
                : MyTheme.lightTheme.textTheme.subtitle2!
                    .copyWith(color: whiteColor),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            date!,
            style: isOFF == false
                ? MyTheme.lightTheme.textTheme.subtitle2
                : MyTheme.lightTheme.textTheme.subtitle2!
                    .copyWith(color: whiteColor),
          ),
        ],
      ),
    ),
  );
}
