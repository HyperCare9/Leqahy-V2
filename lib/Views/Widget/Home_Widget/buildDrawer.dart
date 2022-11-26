import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../Constant/cachHelper.dart';
import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';
import '../../../Model/menus_model/sideMenu_model.dart';
import '../../../Services/MenusBar_Services/menuBar_services.dart';
import '../../Screens/CategoryScreen/category_screen.dart';
import '../../Screens/LoginScreen/loginScreen.dart';
import '../../Screens/OrderScreen/order_product_screen.dart';
import '../../Screens/ProfileScreen/profileScreen.dart';
import '../../Screens/Setting_screen/setting_screen.dart';
import '../General_Widget/loading.dart';
import 'customListTile.dart';

import '../../../Constant/string.dart';

class DrawerWidget extends StatelessWidget {
  void Function()? closeDrawwer;
  DrawerWidget({
    Key? key,
    this.closeDrawwer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        extendBody: true,
        body: Column(
          children: [
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                      backgroundColor: whiteColor,
                      maxRadius: 35,
                      backgroundImage: AssetImage('assets/images/logoMark.png'),
                      child: CircleAvatar(
                        maxRadius: 23,
                        backgroundColor: whiteColor,
                        child: Center(child: Icon(Icons.person)),
                      )),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                        '${CustomerData().cusFirstName} ${CustomerData().cusLastName}',
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        style: MyTheme.lightTheme.textTheme.bodyText2!
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            FutureBuilder<List<SideMenuModel>>(
                future: MenusBarAPI().getSideMenu(
                    languageID: LanguageData().language,
                    platformName: Platform.isAndroid ? 'android' : 'ios'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return customListTile(
                            title: snapshot.data![index].sideMenuName,
                            leadIcon: snapshot.data![index].image,
                            onTap: () {
                              // menuData.goCar(closeDrawer: widget.closeDrawer);
                              Navigator.of(context).pushNamed(
                                  snapshot.data![index].sideMenuName!);
                              closeDrawwer!();
                            },
                          );
                        });
                  } else {
                    return loading();
                  }
                })
          ],
        ));
  }
}
