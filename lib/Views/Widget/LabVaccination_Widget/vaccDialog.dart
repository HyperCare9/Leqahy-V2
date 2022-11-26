import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constant/theme.dart';

vaccDialog({required BuildContext context, dynamic size}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: CupertinoAlertDialog(
            title: Text(
              'Attention'.tr(),
              style: MyTheme.lightTheme.textTheme.headline1!
                  .copyWith(color: Colors.red),
            ),
            content: Text(
              'You must enter all the data correctly and choose one vaccine as a minimum'
                  .tr(),
              style: MyTheme.lightTheme.textTheme.subtitle1,
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
            actions: [
              CupertinoDialogAction(
                child: Text(
                  'Ok'.tr(),
                  style: MyTheme.lightTheme.textTheme.subtitle1!
                      .copyWith(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      });
}
