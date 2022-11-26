// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leqahy_v2/Constant/colors.dart';
import 'package:leqahy_v2/Constant/string.dart';
import 'package:leqahy_v2/Model/Order_model/confirm_order_model.dart';
import 'package:leqahy_v2/Services/Order_Services/order_services.dart';
import 'package:leqahy_v2/Views/Screens/CardScreen/card_screen.dart';
import 'package:leqahy_v2/Views/Screens/OrderScreen/paymentScreen.dart';

import '../../../Constant/theme.dart';
import '../../Widget/General_Widget/buildToast.dart';
import '../../Widget/Order_widget/confirmAddress.dart';

class SummaryScreen extends StatefulWidget {
  int? shipping;
  int? discount;
  int? fees;
  int? subTotal;
  int? total;
  SummaryScreen({
    this.shipping,
    this.discount,
    this.fees,
    this.subTotal,
    this.total,
  });

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  ConfirmOrderModel? confirmOrderModel;
  FToast toast = FToast();

  @override
  void initState() {
    super.initState();
    toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          custConfirm(
            size: size,
            cardColor: darkGrey,
            title: 'Your Order'.tr(),
            child: Column(
              children: [
                cusRow(
                    title: 'Sub Total'.tr(),
                    content: widget.subTotal.toString()),
                const Divider(
                  color: Colors.grey,
                  thickness: 2.0,
                ),
                cusRow(
                    title: 'Shipping'.tr(),
                    content: widget.shipping.toString()),
                const Divider(
                  color: Colors.grey,
                  thickness: 2.0,
                ),
                cusRow(
                    title: 'International Fees'.tr(),
                    content: widget.fees.toString()),
                const Divider(
                  color: Colors.grey,
                  thickness: 2.0,
                ),
                cusRow(title: 'Total'.tr(), content: widget.total.toString()),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.02),
          custConfirm(
              size: size,
              cardColor: whiteColor,
              title: 'Shipping Address'.tr(),
              child: confirmShippingAddress(size: size)),
          SizedBox(height: size.height * 0.02),
          OrderData().orderPayType == '2'
              ? custConfirm(
                  size: size,
                  cardColor: whiteColor,
                  title: 'Payment Address'.tr(),
                  child: confirmShippingAddress(size: size))
              : Container(),
          SizedBox(height: size.height * 0.02),
          custConfirm(
              size: size,
              title: 'Payment Method'.tr(),
              cardColor: darkGrey,
              child: Card(
                color: whiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cach on Delivery'.tr(),
                          style: MyTheme.lightTheme.textTheme.subtitle1!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: mainColor)),
                      Image.asset('assets/images/cart1.png')
                    ],
                  ),
                ),
              )),
          SizedBox(height: size.height * 0.03),
          ElevatedButton(
              onPressed: () async {
                if (OrderData().orderPayType == '') {
                  confirmOrderModel = await OrderAPI().confirmOrder(
                      shippingFirstname: ShippingData().firstName,
                      shippingLastname: ShippingData().lastName,
                      shippingCompany: ShippingData().company,
                      shippingAddress1: ShippingData().address,
                      shippingAddress2: ShippingData().subAddress,
                      shippingCity: ShippingData().city,
                      shippingPostcode: ShippingData().postal,
                      shippingZone: ZoneData().zoneName,
                      shippingZoneId: ZoneData().zoneID,
                      shippingMethod: 'Cach On Delivery',
                      paymentFirstname: ShippingData().firstName,
                      paymentLastname: ShippingData().lastName,
                      paymentCompany: ShippingData().company,
                      paymentAddress1: ShippingData().address,
                      paymentAddress2: ShippingData().subAddress,
                      paymentCity: ShippingData().city,
                      paymentPostcode: ShippingData().postal,
                      paymentZone: ZoneData().zoneName,
                      paymentZoneID: ZoneData().zoneID,
                      paymentMethod: 'Cach On Delivery',
                      languageId: '1',
                      ip: CustomerData().ipAddress);
                  setState(() {});
                  if (confirmOrderModel!.status == true) {
                    showBottomToast(
                      toast: toast,
                      colors: Colors.green,
                      icon: Icons.check_circle_outline,
                      message: 'Confirm Order Succuess'.tr(),
                    );
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => CardScreen(
                              isProduct: false,
                              isProductCategory: false,
                            )));
                  } else {
                    showBottomToast(
                      toast: toast,
                      colors: Colors.red,
                      icon: Icons.warning,
                      message: 'Confirm Order Faild'.tr(),
                    );
                  }
                } else {
                  confirmOrderModel = await OrderAPI().confirmOrder(
                      shippingFirstname: ShippingData().firstName,
                      shippingLastname: ShippingData().lastName,
                      shippingCompany: ShippingData().company,
                      shippingAddress1: ShippingData().address,
                      shippingAddress2: ShippingData().subAddress,
                      shippingCity: ShippingData().city,
                      shippingPostcode: ShippingData().postal,
                      shippingZone: ZoneData().zoneName,
                      shippingZoneId: ZoneData().zoneID,
                      shippingMethod: 'Cach On Delivery',
                      paymentFirstname: PaymentData().firstName,
                      paymentLastname: PaymentData().lastName,
                      paymentCompany: PaymentData().company,
                      paymentAddress1: PaymentData().address,
                      paymentAddress2: PaymentData().subAddress,
                      paymentCity: PaymentData().city,
                      paymentPostcode: PaymentData().postal,
                      paymentZone: ZoneData().pZoneName,
                      paymentZoneID: ZoneData().pZoneID,
                      paymentMethod: 'Cach On Delivery',
                      languageId: '1',
                      ip: CustomerData().ipAddress);
                  setState(() {});
                  if (confirmOrderModel!.status == true) {
                    showBottomToast(
                      toast: toast,
                      colors: Colors.green,
                      icon: Icons.check_circle_outline,
                      message: 'Confirm Order Succuess'.tr(),
                    );
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => CardScreen(
                              isProduct: false,
                              isProductCategory: false,
                            )));
                  } else {
                    showBottomToast(
                      toast: toast,
                      colors: Colors.red,
                      icon: Icons.warning,
                      message: 'Confirm Order Faild'.tr(),
                    );
                  }
                }
              },
              child: Text(
                'Confirm'.tr(),
                style: MyTheme.lightTheme.textTheme.headline3,
              )),
          SizedBox(height: size.height * 0.01),
        ],
      ),
    ));
  }
}

custConfirm(
    {dynamic size, String? title, required Widget child, Color? cardColor}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Card(
        color: mainColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.height * 0.005),
          child: Text(
            title!,
            style: MyTheme.lightTheme.textTheme.subtitle1!
                .copyWith(fontWeight: FontWeight.bold, color: whiteColor),
          ),
        ),
      ),
      SizedBox(
        height: size.height * 0.01,
      ),
      Card(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      )
    ],
  );
}

usRow({String? title, String? content}) {
  return IntrinsicHeight(
    child: Row(
      children: [
        Expanded(
            child: Text(
          title!,
          textAlign: TextAlign.center,
          style: MyTheme.lightTheme.textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.bold),
        )),
        const VerticalDivider(
          color: Colors.grey,
          thickness: 2.0,
        ),
        Expanded(
            child: Text(
          content!,
          textAlign: TextAlign.center,
          style: MyTheme.lightTheme.textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.bold),
        ))
      ],
    ),
  );
}
