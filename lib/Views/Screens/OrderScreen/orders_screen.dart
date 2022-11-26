// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leqahy_v2/Constant/theme.dart';
import 'package:leqahy_v2/Model/Order_model/cancel_order_model.dart';
import 'package:leqahy_v2/Model/Order_model/order_details_model.dart';
import 'package:leqahy_v2/Services/Order_Services/order_services.dart';
import 'package:leqahy_v2/ViewModel/Home_ViewModel/homeViewModel.dart';
import 'package:leqahy_v2/Views/Screens/OrderScreen/oneOrderDetails.dart';
import 'package:leqahy_v2/Views/Widget/General_Widget/buildToast.dart';
import 'package:leqahy_v2/Views/Widget/General_Widget/loading.dart';
import 'package:leqahy_v2/Views/Widget/productWidget/noProductWidget.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/string.dart';
import '../../../Model/cards_model/card_model.dart';
import '../../../Services/Cart_Services/cardsAPI.dart';
import '../../Widget/Home_Widget/buildDrawer.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen();
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  HomeViewModel homeViewModel = HomeViewModel();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  OrderCancelationModel? orderCancelationModel;
  FToast toast = FToast();
  List<CardModel> cartList = [];

  @override
  void initState() {
    super.initState();
    toast.init(context);
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
        extendBody: true,
        drawer: Container(
            color: darkGrey,
            width: size.width * 0.60,
            child: DrawerWidget(
              closeDrawwer: () => scaffoldKey.currentState!.closeDrawer(),
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeViewModel.buildAppBar(
                cartLenght: cartList.length,
                context: context,
                size: size,
                onMenuTapp: () => scaffoldKey.currentState!.openDrawer(),
                isProduct: false,
                isProductCategory: false,
                isPre: false,
                isSuf: false),
            SizedBox(height: size.height * 0.02),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: mainColor, width: 2.0),
                ),
              ),
              child: Text(
                'Order Details'.tr(),
                style: MyTheme.lightTheme.textTheme.headline2!
                    .copyWith(color: mainColor),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Expanded(
                child: FutureBuilder<List<OrderDetailsModel>>(
              future: OrderAPI().getOrderDetails(
                  customerID: '${CustomerData().cusID}',
                  languageID:
                      context.locale == const Locale('en', 'US') ? '1' : '2'),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return snapShot.data!.isNotEmpty
                      ? ListView.builder(
                          itemCount: snapShot.data!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => OneOrderDetails(
                                        orderID: snapShot.data![index].orderId
                                            .toString())));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: size.width * 0.02,
                                    horizontal: size.height * 0.01),
                                margin: EdgeInsets.symmetric(
                                    vertical: size.width * 0.02,
                                    horizontal: size.height * 0.02),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    border:
                                        Border.all(color: darkGrey, width: 2.0),
                                    gradient: const LinearGradient(
                                        colors: [
                                          whiteColor,
                                          whiteColor,
                                          darkGrey,
                                          darkGrey,
                                          darkGrey
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter)),
                                child: Row(
                                  children: [
                                    const Center(
                                        child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      maxRadius: 41,
                                      backgroundImage: AssetImage(
                                          'assets/images/logoMark.png'),
                                      child: CircleAvatar(
                                        maxRadius: 27,
                                        backgroundColor: whiteColor,
                                        backgroundImage: NetworkImage(
                                            'https://leqahyapp.hypercare-eg.com/media/image/notfound/no-order.png'),
                                      ),
                                    )),
                                    Expanded(
                                        child: Padding(
                                      padding: EdgeInsets.only(
                                          left: size.width * 0.02),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                              text: TextSpan(
                                                  style: MyTheme.lightTheme
                                                      .textTheme.subtitle1,
                                                  children: [
                                                TextSpan(
                                                    text:
                                                        'Order Number : '.tr()),
                                                TextSpan(
                                                    text: snapShot
                                                        .data![index].orderId
                                                        .toString())
                                              ])),
                                          RichText(
                                              text: TextSpan(
                                                  style: MyTheme.lightTheme
                                                      .textTheme.subtitle2,
                                                  children: [
                                                TextSpan(
                                                    text:
                                                        'Total Price : '.tr()),
                                                TextSpan(
                                                    text: snapShot
                                                        .data![index].total)
                                              ])),
                                          Divider(
                                            color: Colors.grey[500],
                                            thickness: 2.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              snapShot.data![index]
                                                              .statusName ==
                                                          'Processing' ||
                                                      snapShot.data![index]
                                                              .statusName ==
                                                          'جاري التجهيز'
                                                  ? Card(
                                                      color: Colors.orange,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3.0),
                                                        child: Text(
                                                          snapShot.data![index]
                                                              .statusName!,
                                                          style: MyTheme
                                                              .lightTheme
                                                              .textTheme
                                                              .subtitle2!
                                                              .copyWith(
                                                                  color:
                                                                      whiteColor),
                                                        ),
                                                      ),
                                                    )
                                                  : Card(
                                                      color: Colors.red,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3.0),
                                                        child: Text(
                                                          snapShot.data![index]
                                                              .statusName!,
                                                          style: MyTheme
                                                              .lightTheme
                                                              .textTheme
                                                              .subtitle2!
                                                              .copyWith(
                                                                  color:
                                                                      whiteColor),
                                                        ),
                                                      ),
                                                    ),
                                              snapShot.data![index]
                                                              .statusName ==
                                                          'Processing' ||
                                                      snapShot.data![index]
                                                              .statusName ==
                                                          'جاري التجهيز'
                                                  ? InkWell(
                                                      onTap: () async {
                                                        orderCancelationModel =
                                                            await OrderAPI().cancelOrder(
                                                                customerID:
                                                                    CustomerData()
                                                                        .cusID
                                                                        .toString(),
                                                                orderID: snapShot
                                                                    .data![
                                                                        index]
                                                                    .orderId
                                                                    .toString());
                                                        if (orderCancelationModel!
                                                                .status ==
                                                            true) {
                                                          showBottomToast(
                                                              toast: toast,
                                                              colors:
                                                                  Colors.green,
                                                              icon: Icons.check,
                                                              message:
                                                                  'Cancel Order Success'
                                                                      .tr());
                                                          setState(() {});
                                                        } else {
                                                          showBottomToast(
                                                              toast: toast,
                                                              colors:
                                                                  Colors.red,
                                                              icon:
                                                                  Icons.warning,
                                                              message:
                                                                  'Cancel Order Faield'
                                                                      .tr());
                                                        }
                                                      },
                                                      child: Card(
                                                        color: Colors.red,
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      size.width *
                                                                          0.015,
                                                                  vertical: size
                                                                          .height *
                                                                      0.005),
                                                          child: Text(
                                                            'Cancel'.tr(),
                                                            style: MyTheme
                                                                .lightTheme
                                                                .textTheme
                                                                .subtitle2!
                                                                .copyWith(
                                                                    color:
                                                                        whiteColor),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Container()
                                            ],
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            );
                          })
                      : noCompanyWidget(message: 'There are no any order'.tr());
                } else {
                  return loading();
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
