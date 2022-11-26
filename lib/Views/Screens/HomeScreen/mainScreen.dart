import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../../Constant/initial_route.dart';
import '../AboutScreen/aboutScreen.dart';
import '../AboutScreen/socialScreen.dart';
import 'homeScreen.dart';
import '../OrderScreen/orders_screen.dart';

import '../../../Constant/colors.dart';
import '../../../Model/cards_model/card_model.dart';

class MainScreen extends StatefulWidget {
  static String routeName =
      InitailRoute().route(routeEN: 'Home', routeAR: 'الرئيسيه');
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late double xOffSet;
  late double yOffSet;
  late double scaleFactor;
  late bool isOpenDrawer;
  int currentIndex = 0;
  List<CardModel> cartList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(size.height);
    List screens = [HomeScreen(), OrderScreen(), SocialScreen(), AboutScreen()];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        body: screens[currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          height: size.height >= 950 ? 75.0 : size.height * 0.06,
          backgroundColor: Colors.transparent,
          color: mainColor,
          index: currentIndex,
          items: const [
            Icon(Icons.home_outlined, size: 25, color: whiteColor),
            Icon(Icons.inventory_2_outlined, size: 25, color: whiteColor),
            Icon(Icons.dataset_linked_outlined, size: 25, color: whiteColor),
            Icon(Icons.info_outline_rounded, size: 25, color: whiteColor),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
