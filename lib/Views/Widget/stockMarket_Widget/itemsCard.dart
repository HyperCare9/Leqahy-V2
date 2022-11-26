import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../Constant/theme.dart';

Widget itemsCard(
    {required Size size,
    required BuildContext context,
    String? price1,
    String? unit,
    String? product1,
    String? companyName,
    String? checks}) {
  return SizedBox(
    height: size.height * 0.102,
    child: Card(
      elevation: 0.0,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.08,
          vertical: MediaQuery.of(context).size.height * 0.005),
      color: const Color(0xFFA5DEF9).withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                companyName!,
                textAlign: context.locale == const Locale('en', 'US')
                    ? TextAlign.left
                    : TextAlign.right,
                softWrap: true,
                overflow: TextOverflow.visible,
                style: size.width > 400
                    ? MyTheme.lightTheme.textTheme.bodyText2
                    : MyTheme.lightTheme.textTheme.subtitle2,
              ),
            ),
            Expanded(
              child: Text(
                '$product1',
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.visible,
                style: size.width > 400
                    ? MyTheme.lightTheme.textTheme.bodyText2
                    : MyTheme.lightTheme.textTheme.subtitle2,
              ),
            ),
            Expanded(
              child: Text('$price1',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  style: size.width > 400
                      ? MyTheme.lightTheme.textTheme.bodyText2
                      : MyTheme.lightTheme.textTheme.subtitle2),
            ),
            Expanded(
              child: Text('$unit',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  style: size.width > 400
                      ? MyTheme.lightTheme.textTheme.bodyText2
                      : MyTheme.lightTheme.textTheme.subtitle2),
            ),
            checks == '0'
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.green,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.red,
                      )
                    ],
                  )
                : checks == '1'
                    ? const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.green,
                      ),
          ],
        ),
      ),
    ),
  );
}
