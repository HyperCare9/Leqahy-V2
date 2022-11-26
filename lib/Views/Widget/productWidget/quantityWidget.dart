import 'package:flutter/material.dart';
import '../Card_widget/cartButton.dart';

import '../../../Constant/theme.dart';

quantityWidget(
    {String? quantity, Function()? onminTap, Function()? onplusTap}) {
  return Row(
    children: [
      cartButton(onTap: onplusTap, icon: Icons.add),
      Expanded(
          child: Text(
        quantity!,
        style: MyTheme.lightTheme.textTheme.subtitle1,
        overflow: TextOverflow.visible,
        softWrap: true,
        textAlign: TextAlign.center,
        maxLines: 1,
      )),
      cartButton(onTap: onminTap, icon: Icons.remove),
    ],
  );
}
