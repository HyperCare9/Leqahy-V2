// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leqahy_v2/Views/Screens/CategoryScreen/categor_productScreen.dart';
import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';
import '../../../Model/menu_model/menu_header_model.dart';
import '../../../Services/Menu_Services/menu_services.dart';
import '../../Widget/General_Widget/buildHeader.dart';
import '../../Widget/General_Widget/loading.dart';
import '../../Widget/General_Widget/pageTitle.dart';

class Level2CategoryScreen extends StatefulWidget {
  String? level1ID;
  String? level1NAme;
  Level2CategoryScreen({
    Key? key,
    this.level1ID,
    this.level1NAme,
  }) : super(key: key);

  @override
  State<Level2CategoryScreen> createState() => _Level2CategoryScreenState();
}

class _Level2CategoryScreenState extends State<Level2CategoryScreen> {
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
                pageTitle(
                    context: context, size: size, text: widget.level1NAme),
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
                categoryID: widget.level1ID,
                code: '1'),
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
                                          snapShot.data![index].level2ID,
                                      categoryName:
                                          snapShot.data![index].level2Name,
                                    )));
                          },
                          selectedTileColor: Colors.grey[100],
                          title: Text(snapShot.data![index].level2Name!,
                              style: MyTheme.lightTheme.textTheme.subtitle1!
                                  .copyWith(fontWeight: FontWeight.bold)),
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
