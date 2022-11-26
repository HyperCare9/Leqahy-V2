// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leqahy_v2/Constant/theme.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/string.dart';
import '../../../Services/Cart_Services/cardsAPI.dart';
import '../../../ViewModel/Home_ViewModel/homeViewModel.dart';
import '../../Widget/Home_Widget/buildDrawer.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen();

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  HomeViewModel homeVM = HomeViewModel();

  @override
  void initState() {
    super.initState();
    getCard();
  }

  getCard() async {
    await CardAPI().getCard(languageID: LanguageData().language);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var headStyle = MyTheme.lightTheme.textTheme.bodyText2!
        .copyWith(fontWeight: FontWeight.bold);
    var bodyStyle = MyTheme.lightTheme.textTheme.subtitle1!
        .copyWith(fontWeight: FontWeight.bold, color: Colors.grey);
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      backgroundColor: whiteColor,
      extendBody: true,
      drawer: Container(
          color: darkGrey,
          width: size.width * 0.60,
          child: DrawerWidget(
            closeDrawwer: () => scaffoldKey.currentState!.closeDrawer(),
          )),
      body: Column(
        children: [
          homeVM.buildAppBar(
              size: size,
              context: context,
              cartLenght: customCardModel.length,
              onMenuTapp: () => scaffoldKey.currentState!.openDrawer(),
              isPre: false,
              isSuf: false,
              isProduct: false,
              isProductCategory: false),
          SizedBox(
            height: size.height * 0.02,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/about.png',
                  height: size.height * 0.25,
                  width: size.width * 0.80,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: RichText(
                        textAlign: context.locale == const Locale('en', 'US')
                            ? TextAlign.left
                            : TextAlign.right,
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'What is Leqahy?'.tr(), style: headStyle),
                          const TextSpan(text: '\n'),
                          TextSpan(
                            text: 'aboutBody1'.tr(),
                            style: bodyStyle,
                          ),
                          const TextSpan(text: '\n'),
                          const TextSpan(text: '\n'),
                          const TextSpan(text: '\n'),
                          TextSpan(
                              text: 'What are the products we provide?'.tr(),
                              style: headStyle),
                          const TextSpan(text: '\n'),
                          TextSpan(
                            text: 'aboutBody2'.tr(),
                            style: bodyStyle,
                          ),
                          const TextSpan(text: '\n'),
                          const TextSpan(text: '\n'),
                          const TextSpan(text: '\n'),
                          TextSpan(
                              text: 'What are the services we provide?'.tr(),
                              style: headStyle),
                          const TextSpan(text: '\n'),
                          TextSpan(
                            text: 'aboutBody3'.tr(),
                            style: bodyStyle,
                          ),
                        ]))),
                SizedBox(height: size.height * 0.02)
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
