import 'package:flutter/material.dart';
import '../../../Constant/theme.dart';

PreferredSizeWidget bulidAppBar(
    {required String title,
    required BuildContext context,
    required bool action,
    required bool prefix,
    required Color appColor,
    required Color titleColor,
    Function()? preFun,
    Function()? sufFun,
    IconData? preIcon,
    IconData? sufIcon,
    Color? preColor,
    Color? customtitileColor,
    Color? sufColor,
    TabBar? tabBarchild}) {
  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * 0.06,
    elevation: 0.0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    title: Text(title,
        style: MyTheme.lightTheme.textTheme.headline2!
            .copyWith(color: customtitileColor, fontWeight: FontWeight.bold)),
    flexibleSpace: Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)),
          color: appColor),
    ),
    leading: prefix == true
        ? IconButton(
            onPressed: preFun,
            icon: Icon(
              preIcon,
              size: 20,
              color: preColor,
            ),
          )
        : Container(),
    actions: [
      action == true
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: IconButton(
                onPressed: sufFun,
                icon: Icon(
                  sufIcon,
                  size: 20,
                  color: sufColor,
                ),
                color: sufColor,
              ),
            )
          : Container(),
    ],
    bottom: tabBarchild,
  );
}
