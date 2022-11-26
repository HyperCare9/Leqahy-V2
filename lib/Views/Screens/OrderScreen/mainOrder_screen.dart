// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:leqahy_v2/Views/Screens/CardScreen/card_screen.dart';

import 'package:leqahy_v2/Views/Screens/OrderScreen/paymentScreen.dart';
import 'package:leqahy_v2/Views/Screens/OrderScreen/summaryScreen.dart';
import 'package:leqahy_v2/Views/Widget/Order_widget/order_details.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/initial_route.dart';
import '../../Widget/General_Widget/buildHeader.dart';
import 'deliveryScreen.dart';

class MainOrderScreen extends StatefulWidget {
  int? shipping;
  int? discount;
  int? fees;
  int? subTotal;
  int? total;
  MainOrderScreen({
    Key? key,
    this.shipping,
    this.discount,
    this.fees,
    this.subTotal,
    this.total,
  }) : super(key: key);

  @override
  State<MainOrderScreen> createState() => _MainOrderScreenState();
}

class _MainOrderScreenState extends State<MainOrderScreen> {
  int index = 0;
  bool isDelivery = true;
  bool isPayment = false;
  bool isSummary = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List screens = [
      DeleviryScreen(
          discount: widget.discount,
          fees: widget.fees,
          shipping: widget.shipping,
          subTotal: widget.subTotal,
          total: widget.total,
          onNext: () {
            setState(() {
              index = 1;
              isDelivery = false;
              isPayment = true;
            });
          }),
      PaymentScreen(
        discount: widget.discount,
        fees: widget.fees,
        shipping: widget.shipping,
        subTotal: widget.subTotal,
        total: widget.total,
        onProceed: () {
          setState(() {
            index = 2;
            isDelivery = false;
            isPayment = false;
            isSummary = true;
          });
        },
      ),
      SummaryScreen(
        discount: widget.discount,
        fees: widget.fees,
        shipping: widget.shipping,
        subTotal: widget.subTotal,
        total: widget.total,
      ),
    ];
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          buildcustomHeader(
              context: context,
              size: size,
              preColor: mainColor,
              sufColor: Colors.transparent,
              sufIcon: Icons.arrow_back_ios,
              preIcon: Icons.arrow_back_ios,
              preFun: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => CardScreen(
                          isProduct: false,
                          isProductCategory: false,
                        )));
              },
              sufFun: () {}),
          SizedBox(height: size.height * 0.01),
          orderDetails(
              size: size,
              isDelivery: isDelivery,
              isPayment: isPayment,
              isSummary: isSummary,
              onDeliveryTap: () {
                if (index > 0) {
                  setState(() {
                    index = 0;
                    isDelivery = true;
                    isPayment = false;
                    isSummary = false;
                  });
                }
              },
              onPaymentTap: () {
                if (index > 1) {
                  setState(() {
                    index = 1;
                    isDelivery = false;
                    isPayment = true;
                    isSummary = false;
                  });
                }
              }),
          Expanded(child: screens[index])
        ],
      ),
    ));
  }
}
