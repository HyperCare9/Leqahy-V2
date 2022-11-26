// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Constant/colors.dart';
import '../../../Constant/string.dart';
import '../../../Constant/theme.dart';
import '../../../Services/Cart_Services/cardsAPI.dart';
import '../../../ViewModel/Home_ViewModel/homeViewModel.dart';
import '../../Widget/Home_Widget/buildDrawer.dart';

class SocialScreen extends StatefulWidget {
  SocialScreen();

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
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
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
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
          SizedBox(height: size.height * 0.04),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Column(
                children: [
                  socialRow(
                      context: context,
                      isLunch: true,
                      size: size,
                      icon: Icons.language,
                      iconColor: mainColor,
                      iconSize: 40,
                      url: 'https://hypercare-eg.com'),
                  SizedBox(height: size.height * 0.02),
                  socialRow(
                      context: context,
                      size: size,
                      isLunch: true,
                      icon: FontAwesomeIcons.facebook,
                      iconColor: Colors.blue,
                      iconSize: 35,
                      url: 'https://www.facebook.com/Leqahy-109383601773013'),
                  SizedBox(height: size.height * 0.02),
                  socialRow(
                      context: context,
                      size: size,
                      isLunch: false,
                      iconSize: 35,
                      icon: FontAwesomeIcons.googlePlus,
                      iconColor: Colors.red,
                      url: 'hypercare9@gmail.com'),
                  SizedBox(height: size.height * 0.02),
                  socialRow(
                      context: context,
                      size: size,
                      iconSize: 35,
                      isLunch: true,
                      icon: FontAwesomeIcons.linkedin,
                      iconColor: mainColor,
                      url: 'https://www.linkedin.com/company/hypercare-egypt/')
                ],
              ),
            ),
          ))
        ],
      ),
    ));
  }
}

socialRow(
    {IconData? icon,
    Color? iconColor,
    dynamic size,
    String? url,
    required bool isLunch,
    double? iconSize,
    required BuildContext context}) {
  return InkWell(
    onTap: isLunch == true
        ? () {
            launchUrl(Uri.parse(url!));
          }
        : null,
    child: Card(
      color: darkGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.01, horizontal: size.width * 0.03),
        child: Row(
          children: [
            FaIcon(icon, color: iconColor, size: iconSize),
            SizedBox(width: size.width * 0.02),
            Expanded(
                child: Text(
              url!,
              softWrap: true,
              overflow: TextOverflow.visible,
              maxLines: 1,
              style: MyTheme.lightTheme.textTheme.subtitle1!
                  .copyWith(color: Colors.blue, fontWeight: FontWeight.bold),
            ))
          ],
        ),
      ),
    ),
  );
}
