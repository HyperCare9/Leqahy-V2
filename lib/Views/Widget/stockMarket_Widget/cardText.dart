import 'package:flutter/cupertino.dart';
import '../../../Constant/theme.dart';

cardText({String? text, double? size}) {
  return SizedBox(
    width: size,
    child: Text(
      text!,
      overflow: TextOverflow.visible,
      softWrap: true,
      textAlign: TextAlign.center,
      style: MyTheme.lightTheme.textTheme.subtitle2,
    ),
  );
}
