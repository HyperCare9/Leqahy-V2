import 'package:flutter/material.dart';
import '../../../Constant/colors.dart';
import 'leqahy_logo.dart';

import '../../../Constant/theme.dart';

PreferredSizeWidget coloriesAppBar(
    {required BuildContext context,
    required bool action,
    required bool prefix,
    Function()? preFun,
    Function()? sufFun,
    Widget? preWidget,
    List<Widget>? sufWidget,
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
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customLeqahyLogo(logoColor: whiteColor),
        const SizedBox(width: 7.0),
        Text(
          'Leqahy',
          style: MyTheme.lightTheme.textTheme.subtitle1!
              .copyWith(color: whiteColor),
        )
      ],
    ),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [mainColor, mainColor])),
    ),
    leading: prefix == true ? preWidget : Container(),
    actions: action == true ? sufWidget : [],
    bottom: tabBarchild,
  );
}
