import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../Constant/theme.dart';
import '../../Views/Screens/CardScreen/card_screen.dart';
import '../../Views/Widget/General_Widget/colories_appBar.dart';
import '../../Constant/colors.dart';
import '../../Views/Screens/AccademyScreen/accademy_screen.dart';
import '../../Views/Screens/AntisepticsScreen/antiseptics_screen.dart';
import '../../Views/Screens/DoctorScreen/doctorScreen.dart';
import '../../Views/Screens/LabVaccinationScreen/labvaccination_screen.dart';
import '../../Views/Screens/stockmarketScreen/stockmarket_screen.dart';
import '../../Views/Screens/vaccineScreen/vaccineScreen.dart';
import '../../Views/Widget/Home_Widget/buildIconCard.dart';

class HomeViewModel {
  homeAppBar({BuildContext? context, Function()? onTap, Function()? onTapp}) {
    return coloriesAppBar(
        context: context!,
        action: true,
        prefix: true,
        preWidget: IconButton(
            onPressed: onTap,
            icon: const Icon(
              Icons.menu,
              size: 25,
              color: whiteColor,
            )),
        sufWidget: [
          IconButton(
              onPressed: onTap,
              icon: const Icon(
                Icons.notifications,
                size: 25,
                color: whiteColor,
              )),
        ]);
  }

  buildAppBar(
      {dynamic size,
      required BuildContext context,
      int? cartLenght,
      Function()? onMenuTapp,
      required bool isPre,
      Function()? preFun,
      IconData? preIcon,
      Color? preColor,
      required bool isSuf,
      Function()? sufFun,
      IconData? sufIcon,
      Color? sufColor,
      required bool isProduct,
      required bool isProductCategory,
      String? companyID,
      String? companyName,
      String? categoryID,
      String? categoryName}) {
    return Container(
      height: size.height * 0.09,
      margin:
          EdgeInsets.only(top: size.height * 0.01, bottom: size.height * 0.01),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: InkWell(
              onTap: onMenuTapp,
              child: const Icon(
                Icons.menu,
                size: 25,
                color: mainColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            child: InkWell(
              onTap: isPre == true ? preFun : null,
              child: Icon(
                isPre == true ? preIcon : Icons.arrow_back_ios,
                size: 25,
                color: isPre == true ? preColor : Colors.transparent,
              ),
            ),
          ),
          Expanded(
              child: Image.asset(
            context.locale == const Locale('en', 'US')
                ? 'assets/images/logo.png'
                : 'assets/images/Logo_Ar.png',
            height: size.height * 0.07,
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            child: InkWell(
              onTap: isSuf == true ? sufFun : null,
              child: Icon(
                isSuf == true ? sufIcon : Icons.arrow_back_ios,
                size: 25,
                color: isSuf == true ? sufColor : Colors.transparent,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: InkWell(
              onTap: () {
                if (isProduct == true || isProductCategory == true) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => CardScreen(
                            isProduct: isProduct,
                            isProductCategory: isProductCategory,
                            companyID: companyID,
                            companyName: companyName,
                            categoryID: categoryID,
                            categoryName: categoryName,
                          )));
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => CardScreen(
                            isProduct: isProduct,
                            isProductCategory: isProductCategory,
                            companyID: companyID,
                            companyName: companyName,
                            categoryID: categoryID,
                            categoryName: categoryName,
                          )));
                }
              },
              child: Badge(
                badgeContent: Text(
                  '$cartLenght',
                  style: MyTheme.lightTheme.textTheme.headline4,
                ),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 25,
                  color: mainColor,
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Badge(
          //     badgeContent: Text(
          //       '2',
          //       style: MyTheme.lightTheme.textTheme.headline4,
          //     ),
          //     child: const Icon(
          //       Icons.notifications_none,
          //       size: 25,
          //       color: mainColor,
          //     ),
          //   ),
          // ),
          // const Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Icon(
          //     Icons.logout_outlined,
          //     size: 25,
          //     color: mainColor,
          //   ),
          // ),
        ],
      ),
    );
  }

  buildCategory({dynamic size, required BuildContext context}) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildLeqahyIconCard(
                  size: size,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => VaccineScreen(
                              classID: '1',
                            )));
                  },
                  text: 'Vaccine'.tr(),
                  img: 'G1'),
              // buildLeqahyIconCard(
              //     size: size,
              //     onTap: () {
              //       Navigator.of(context).push(MaterialPageRoute(
              //           builder: (_) => DrugsScreen(
              //                 classID: '3',
              //               )));
              //     },
              //     text: 'Drugs',
              //     img: 'G2'),
              buildLeqahyIconCard(
                  size: size,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => AntisepticsScreen(
                              classID: '2',
                            )));
                  },
                  text: 'Disinfectant'.tr(),
                  img: 'G3'),
              buildLeqahyIconCard(
                  size: size,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const StockMarketScreen()));
                  },
                  text: 'Stock Market'.tr(),
                  img: 'G4'),
            ],
          ),
          SizedBox(height: size.height * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // buildLeqahyIconCard(
              //     size: size,
              //     onTap: () {
              //       Navigator.of(context).push(MaterialPageRoute(
              //           builder: (_) => const StockMarketScreen()));
              //     },
              //     text: 'Stock Market',
              //     img: 'G4'),
              buildLeqahyIconCard(
                  size: size,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const LabVaccinationScreen()));
                  },
                  text: 'Lab Vaccine'.tr(),
                  img: 'G5'),
              buildLeqahyIconCard(
                  size: size,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const DoctorScreen()));
                  },
                  text: 'Doctors'.tr(),
                  img: 'G7'),
              buildLeqahyIconCard(
                  size: size,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const AccademyScreen()));
                  },
                  text: 'Accademy'.tr(),
                  img: 'G8'),
              // buildLeqahyIconCard(
              //     size: size, onTap: () {}, text: 'Lab Services', img: 'G6'),
            ],
          ),
          // SizedBox(height: size.height * 0.015),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     buildLeqahyIconCard(
          //         size: size,
          //         onTap: () {
          //           Navigator.of(context).push(MaterialPageRoute(
          //               builder: (_) => const DoctorScreen()));
          //         },
          //         text: 'Doctors',
          //         img: 'G7'),
          //     buildLeqahyIconCard(
          //         size: size,
          //         onTap: () {
          //           Navigator.of(context).push(MaterialPageRoute(
          //               builder: (_) => const AccademyScreen()));
          //         },
          //         text: 'Accademy',
          //         img: 'G8'),
          //     buildLeqahyIconCard(
          //         size: size, onTap: () {}, text: 'Wuzzuf', img: 'G9'),
          //   ],
          // )
        ],
      ),
    ));
  }
}
