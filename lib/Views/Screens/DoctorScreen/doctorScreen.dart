import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../Constant/initial_route.dart';
import '../../../Constant/theme.dart';
import '../../../Model/doctor_model/doctor_model.dart';
import '../../../Services/doctor_Services/doctor_services.dart';
import 'appoinmentScreen.dart';
import 'bookDoctor.dart';
import 'doctorDetails.dart';
import '../../Widget/General_Widget/loading.dart';
import '../../../Constant/colors.dart';
import '../../../Constant/string.dart';
import '../../../Model/cards_model/card_model.dart';
import '../../../Services/Cart_Services/cardsAPI.dart';
import '../../../ViewModel/Home_ViewModel/homeViewModel.dart';
import '../../Widget/General_Widget/pageTitle.dart';
import '../../Widget/Home_Widget/buildDrawer.dart';

class DoctorScreen extends StatefulWidget {
  static String routeName =
      InitailRoute().route(routeEN: 'Doctors', routeAR: 'الدكاتره');
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  List<CardModel> cartList = [];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  HomeViewModel homeVM = HomeViewModel();

  @override
  void initState() {
    super.initState();
    getCard();
  }

  getCard() async {
    cartList = await CardAPI().getCard(languageID: LanguageData().language);
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          homeVM.buildAppBar(
              size: size,
              context: context,
              cartLenght: cartList.length,
              onMenuTapp: () => scaffoldKey.currentState!.openDrawer(),
              isPre: true,
              isSuf: true,
              preIcon: Icons.arrow_back_ios,
              preColor: mainColor,
              isProduct: false,
              isProductCategory: false,
              preFun: () {
                getCard();
                Navigator.of(context).pop();
              },
              sufIcon: Icons.folder_shared_outlined,
              sufColor: mainColor,
              sufFun: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const AppoinmentScreen()));
              }),
          pageTitle(context: context, size: size, text: 'Doctors'.tr()),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
              child: FutureBuilder<List<DoctorModel>>(
                  future: DoctorServices().getAllDoctors(
                      languageID: context.locale == const Locale('en', 'US')
                          ? '1'
                          : '2'),
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapShot.data!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => DoctorDetails(
                                          doctorID:
                                              snapShot.data![index].doctorId,
                                        )));
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03,
                                    vertical: size.height * 0.02),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    gradient: const LinearGradient(
                                        colors: [
                                          whiteColor,
                                          darkGrey,
                                          darkGrey,
                                          darkGrey
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.03),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            children: [
                                              RichText(
                                                  text: TextSpan(
                                                      style: MyTheme.lightTheme
                                                          .textTheme.bodyText2!
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                      children: [
                                                    TextSpan(text: 'Dr /'.tr()),
                                                    TextSpan(
                                                        text:
                                                            ' ${snapShot.data![index].doctorName}')
                                                  ])),
                                              SizedBox(
                                                  height: size.height * 0.01),
                                              Text(
                                                snapShot
                                                    .data![index].specialName!,
                                                style: MyTheme.lightTheme
                                                    .textTheme.subtitle1,
                                              ),
                                              SizedBox(
                                                  height: size.height * 0.005),
                                            ],
                                          ),
                                          Center(
                                              child: CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            maxRadius: 40,
                                            backgroundImage: const AssetImage(
                                                'assets/images/logoMark.png'),
                                            child: CircleAvatar(
                                              maxRadius: 27,
                                              backgroundColor: whiteColor,
                                              backgroundImage: snapShot
                                                          .data![index].image !=
                                                      ''
                                                  ? NetworkImage(snapShot
                                                      .data![index].image!)
                                                  : const NetworkImage(
                                                      'https://leqahyshop.hypercare-eg.com/image/catalog/loqa7y/Manufacturer/Medivac.jpeg'),
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey[500]!,
                                      thickness: 1.5,
                                      indent: size.width * 0.03,
                                      endIndent: size.width * 0.03,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.09),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RichText(
                                              text: TextSpan(
                                                  style: MyTheme.lightTheme
                                                      .textTheme.subtitle1,
                                                  children: [
                                                TextSpan(text: 'Fees :'.tr()),
                                                TextSpan(
                                                    text: snapShot
                                                        .data![index].price)
                                              ])),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          BookDoctorScreen(
                                                            doctorID: snapShot
                                                                .data![index]
                                                                .doctorId,
                                                            doctorName: snapShot
                                                                .data![index]
                                                                .doctorName,
                                                          )));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color:
                                                              Colors.grey[500]!,
                                                          width: 5.0))),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: context.locale ==
                                                            const Locale(
                                                                'en', 'US')
                                                        ? const EdgeInsets.only(
                                                            bottom: 4.0,
                                                            right: 4.0)
                                                        : const EdgeInsets.only(
                                                            bottom: 4.0,
                                                            left: 4.0),
                                                    child: const Icon(
                                                      Icons.access_alarm,
                                                      size: 15.0,
                                                      color: mainColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Book now'
                                                        .tr()
                                                        .toUpperCase(),
                                                    style: MyTheme.lightTheme
                                                        .textTheme.subtitle1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return loading();
                    }
                  }),
            ),
          ),
        ],
      ),
    ));
  }
}
