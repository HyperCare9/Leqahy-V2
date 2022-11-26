// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leqahy_v2/Views/Screens/CategoryScreen/categor_productScreen.dart';
import 'package:leqahy_v2/Views/Screens/CategoryScreen/category_level2.dart';
import 'package:leqahy_v2/Views/Widget/General_Widget/pageTitle.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/initial_route.dart';
import '../../../Constant/theme.dart';
import '../../../Model/menu_model/menu_header_model.dart';
import '../../../Services/Menu_Services/menu_services.dart';
import '../../Widget/General_Widget/buildHeader.dart';
import '../../Widget/General_Widget/loading.dart';

class Level1CategoryScreen extends StatefulWidget {
  String? topID;
  String? topName;
  Level1CategoryScreen({
    Key? key,
    this.topID,
    this.topName,
  }) : super(key: key);

  @override
  State<Level1CategoryScreen> createState() => _Level1CategoryScreenState();
}

class _Level1CategoryScreenState extends State<Level1CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildcustomHeader(
                    context: context,
                    size: size,
                    preColor: mainColor,
                    sufColor: Colors.transparent,
                    sufIcon: Icons.edit,
                    preIcon: Icons.arrow_back_ios,
                    preFun: () {
                      Navigator.of(context).pop();
                    },
                    sufFun: () {}),
                pageTitle(context: context, size: size, text: widget.topName),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Expanded(
              child: FutureBuilder<List<MenuHeaderModel>>(
            future: MenuAPI().getMenuHeader(
                languageID:
                    context.locale == const Locale('en', 'US') ? '1' : '2',
                categoryID: widget.topID,
                code: '0'),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return ListView.builder(
                    itemCount: snapShot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.055,
                            vertical: size.height * 0.005),
                        child: ListTile(
                          selected: true,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => CategoryProductScreen(
                                      categoryID:
                                          snapShot.data![index].level1ID,
                                      categoryName:
                                          snapShot.data![index].level1Name,
                                    )));
                          },
                          selectedTileColor: Colors.grey[100],
                          title: Text(snapShot.data![index].level1Name!,
                              style: MyTheme.lightTheme.textTheme.subtitle1!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          trailing: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => Level2CategoryScreen(
                                        level1ID:
                                            snapShot.data![index].level1ID,
                                        level1NAme:
                                            snapShot.data![index].level1Name,
                                      )));
                            },
                            child: Container(
                              width: size.width * 0.15,
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.02),
                              child: Icon(
                                context.locale == const Locale('en', 'US')
                                    ? Icons.arrow_forward_ios
                                    : Icons.arrow_forward_ios,
                                color: mainColor,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return loading();
              }
            },
          ))
        ],
      ),
    ));
  }
}
