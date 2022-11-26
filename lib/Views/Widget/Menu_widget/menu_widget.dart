import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../Model/menu_model/menu_header_model.dart';
import '../../../Services/Menu_Services/menu_services.dart';
import '../General_Widget/loading.dart';

import '../../../Constant/theme.dart';

menuContainer(
    {required BuildContext context, dynamic size, String? categoryID}) {
  return FutureBuilder<List<MenuHeaderModel>>(
      future: MenuAPI().getMenuHeader(
          languageID: context.locale == const Locale('en', 'US') ? '1' : '2',
          code: '1',
          categoryID: categoryID),
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          return ListView.builder(
              itemCount: snapShot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                  child: ListTile(
                    title: Text(
                      snapShot.data![index].level2Name!,
                      style: MyTheme.lightTheme.textTheme.subtitle1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              });
        } else {
          return loading();
        }
      });
}
