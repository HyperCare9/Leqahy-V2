import 'package:flutter/material.dart';
import '../../../Constant/colors.dart';

import '../../../Constant/theme.dart';

customListTile({String? title, String? leadIcon, Function()? onTap}) {
  return ListTile(
    minLeadingWidth: 20.0,
    selectedTileColor: Colors.black12,
    title: Text(
      title!,
      style: MyTheme.lightTheme.textTheme.subtitle1,
    ),
    leading: Image.network(
      leadIcon!,
      height: 20,
      width: 20,
      color: mainColor,
    ),
    onTap: onTap,
  );
}
