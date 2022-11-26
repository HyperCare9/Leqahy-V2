import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter/material.dart';
import '../../Constant/colors.dart';
import '../../Views/Widget/General_Widget/colories_appBar.dart';
import '../../Views/Widget/stockMarket_Widget/cardIcon.dart';

class StockMarketViewModel {
  String type = 'كتاكيت';

  // this widget return custom app bar
  stockAppBar({BuildContext? context}) {
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
              size: 20,
              color: mainColor,
            )),
        sufWidget: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.transparent,
              )),
        ]);
  }

  //this widget return button of stockMarket
  stockCategory({
    dynamic size,
    Function()? onTapChicks,
    Function()? onTapFeed,
    Function()? onTapEggs,
    Function()? onTapMeet,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.01, horizontal: size.width * 0.06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          cardIcon(
              size: size,
              text: 'Chicks'.tr(),
              img: 'check',
              onTap: onTapChicks!),
          cardIcon(
              size: size, text: 'Feed'.tr(), img: 'balet', onTap: onTapFeed!),
          cardIcon(
              size: size, text: 'Eggs'.tr(), img: 'eggs', onTap: onTapEggs!),
          cardIcon(
              size: size, text: 'Meet'.tr(), img: 'meet', onTap: onTapMeet!)
        ],
      ),
    );
  }
}
