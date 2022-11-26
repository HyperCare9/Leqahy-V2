import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../Constant/initial_route.dart';
import '../../../Model/menu_model/menu_header_model.dart';
import '../../../Services/Menu_Services/menu_services.dart';
import 'categor_productScreen.dart';
import 'category_level1.dart';
import '../../Widget/General_Widget/loading.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';
import '../../Widget/General_Widget/buildHeader.dart';

class CategoriesScreen extends StatefulWidget {
  static String routeName =
      InitailRoute().route(routeEN: 'Filter', routeAR: 'تصنيف');
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<bool> expand = [];
  List<bool> expand2 = [];
  List<Map<String, dynamic>> total = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: Column(
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
              categoryID: '',
              code: ''),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapShot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.005),
                      child: ListTile(
                        selected: true,
                        selectedTileColor: Colors.grey[100],
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => CategoryProductScreen(
                                    categoryID: snapShot.data![index].topID,
                                    categoryName: snapShot.data![index].topName,
                                  )));
                        },
                        title: Text(snapShot.data![index].topName!,
                            style: MyTheme.lightTheme.textTheme.subtitle1!
                                .copyWith(fontWeight: FontWeight.bold)),
                        trailing: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => Level1CategoryScreen(
                                      topID: snapShot.data![index].topID,
                                      topName: snapShot.data![index].topName,
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
    )));
  }
}
