import 'package:flutter/material.dart';

import '../../Constant/colors.dart';
import '../../Views/Widget/General_Widget/colories_appBar.dart';

class VaccinationViewModel {
  vaccineAppBar({BuildContext? context}) {
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
}
