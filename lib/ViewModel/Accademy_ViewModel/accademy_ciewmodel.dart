import 'package:flutter/material.dart';

import '../../Constant/colors.dart';
import '../../Constant/theme.dart';
import '../../Views/Widget/General_Widget/colories_appBar.dart';

class AccademyViewModel {
  accademyAPPBar({BuildContext? context}) {
    return coloriesAppBar(
        context: context!,
        action: true,
        prefix: true,
        preWidget: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: whiteColor,
              size: 25,
            )),
        sufWidget: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.transparent,
                size: 25,
              ))
        ]);
  }

  cusRow({IconData? icon, String? data1, String? data2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.grey,
        ),
        Text(
          data1!,
          style: MyTheme.lightTheme.textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          data2!,
          style: MyTheme.lightTheme.textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
