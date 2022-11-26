// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:leqahy_v2/Constant/cachHelper.dart';
import 'package:leqahy_v2/Constant/colors.dart';
import 'package:leqahy_v2/Constant/string.dart';
import 'package:leqahy_v2/Model/menus_model/homeMenu_model.dart';
import 'package:leqahy_v2/Services/MenusBar_Services/menuBar_services.dart';
import 'package:leqahy_v2/ViewModel/Home_ViewModel/homeViewModel.dart';
import 'package:leqahy_v2/Views/Widget/General_Widget/smoothIndicator.dart';
import 'package:leqahy_v2/Views/Widget/Home_Widget/buildDrawer.dart';
import 'package:leqahy_v2/Views/Widget/Home_Widget/buildIconCard.dart';
import 'dart:io' show Platform;
import '../../../Model/banner_model/banner_model.dart';
import '../../../Model/cards_model/card_model.dart';
import '../../../Services/Banner_Services/banner_services.dart';
import '../../../Services/Cart_Services/cardsAPI.dart';
import '../../Widget/General_Widget/loading.dart';

class HomeScreen extends StatefulWidget {
  // final VoidCallback openDrawer;
  // HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  int lenght = 3;
  TextEditingController searchController = TextEditingController();
  int currentIndex = 0;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<CardModel> cartList = [];
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
    HomeViewModel homeVM = HomeViewModel();

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
              isProduct: false,
              isProductCategory: false,
              isPre: false,
              isSuf: false),
          SizedBox(
            height: size.height * 0.04,
          ),
          FutureBuilder<List<BannnerModel>>(
              future: BannerServices().getBanner(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return CarouselSlider.builder(
                    itemCount: snapShot.data!.length,
                    options: CarouselOptions(
                        // height: size.height * 0.20,
                        height: size.height * 0.27,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.easeInOut,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reson) {
                          setState(() {
                            lenght = snapShot.data!.length;
                            activeIndex = index;
                          });
                        }),
                    itemBuilder: (context, itemIndex, pageViewIndex) {
                      lenght = snapShot.data!.length;
                      return Container(
                        height: size.height * 0.21,
                        width: size.width * 0.95,
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.005),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.grey[500]!)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              snapShot.data![itemIndex].image !=
                                      'https://leqahyapp.hypercare-eg.com/media/'
                                  ? '${snapShot.data![itemIndex].image}'
                                  : 'https://leqahyshop.hypercare-eg.com/image/catalog/loqa7y/Manufacturer/Medivac.jpeg',
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return const Text('error');
                              },
                            )),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
          SizedBox(
            height: size.height * 0.02,
          ),
          smoothIndicator(
              activeIndex: activeIndex, itemCount: lenght < 5 ? lenght : 5),
          SizedBox(
            height: size.height * 0.07,
          ),
          Expanded(
            child: FutureBuilder<List<HomeMenuModel>>(
                future: MenusBarAPI().getHomeMenu(
                    platformName: Platform.isAndroid ? 'android' : 'ios',
                    languageID: LanguageData().language),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    return GridView.builder(
                        shrinkWrap: true,
                        // scrollDirection: Axis.horizontal,
                        itemCount: snapShot.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 1.0,
                          mainAxisSpacing: 1.0,
                        ),
                        itemBuilder: (context, index) {
                          return buildLeqahyIconCard(
                              size: size,
                              onTap: () {
                                if (snapShot.data![index].name == 'الرئيسيه' ||
                                    snapShot.data![index].name == 'Home') {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '${snapShot.data![index].name}',
                                      (route) => true,
                                      arguments: snapShot.data![index].classId
                                          .toString());
                                } else if (snapShot.data![index].name ==
                                        'تسجيل الخروج' ||
                                    snapShot.data![index].name == 'Logout') {
                                  CachHelper.clearData();
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    '${snapShot.data![index].name}',
                                    (route) => false,
                                  );
                                } else {
                                  Navigator.of(context).pushNamed(
                                      '${snapShot.data![index].name}',
                                      arguments: snapShot.data![index].classId
                                          .toString());
                                }
                              },
                              text: snapShot.data![index].name,
                              img: snapShot.data![index].image);
                        });
                  } else {
                    return loading();
                  }
                }),
          )
        ],
      ),
    ));
  }
}
