import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Constant/cachHelper.dart';
import '../../../Constant/initial_route.dart';
import '../../Widget/General_Widget/buildToast.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';
import '../../Widget/General_Widget/buildHeader.dart';

class SettingScreen extends StatefulWidget {
  static String routeName =
      InitailRoute().route(routeEN: 'Settings', routeAR: 'الإعدادت');
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<bool> expand = [false, false];
  FToast toast = FToast();

  @override
  void initState() {
    super.initState();
    toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          buildcustomHeader(
              context: context,
              size: size,
              preColor: mainColor,
              sufColor: Colors.transparent,
              sufIcon: Icons.delete,
              preIcon: Icons.arrow_back_ios,
              preFun: () {
                Navigator.of(context).pop();
              },
              sufFun: () {}),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: ExpansionPanelList(
              children: [
                ExpansionPanel(
                    backgroundColor: darkGrey,
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) => ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          leading: const Icon(
                            Icons.language,
                            size: 20,
                            color: mainColor,
                          ),
                          title: Text('App Language'.tr().toString(),
                              style: MyTheme.lightTheme.textTheme.subtitle1!
                                  .copyWith(fontWeight: FontWeight.bold)),
                        ),
                    body: Column(
                      children: [
                        ListTile(
                          onTap: () async {
                            Locale val = const Locale('en', 'US');
                            context.setLocale(val);
                            //Navigator.pop(context);
                            CachHelper.saveData(key: 'Lang', value: '1');
                            expand = [false, false];
                            showBottomToast(
                                toast: toast,
                                colors: Colors.green,
                                icon: Icons.check,
                                message: 'Application Language is English Now');
                          },
                          title: Center(
                            child: Text('English'.tr(),
                                style: MyTheme.lightTheme.textTheme.subtitle1!
                                    .copyWith(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        ListTile(
                          onTap: () async {
                            Locale val = const Locale('ar', 'EG');
                            context.setLocale(val);
                            print(val.toString());
                            CachHelper.saveData(key: 'Lang', value: '2');
                            //Navigator.pop(context);
                            expand = [false, false];
                            showBottomToast(
                                toast: toast,
                                colors: Colors.green,
                                icon: Icons.check,
                                message: 'لفة التطبيق اللغة العربية الآن');
                          },
                          title: Center(
                            child: Text('Arabic'.tr(),
                                style: MyTheme.lightTheme.textTheme.subtitle1!
                                    .copyWith(fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                    isExpanded: expand[0]),
              ],
              expansionCallback: (i, isExpanded) => setState(() {
                print(isExpanded);
                expand[i] = !isExpanded;
              }),
            ),
          )
        ],
      ),
    ));
  }
}
