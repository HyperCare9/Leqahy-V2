// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:leqahy_v2/Constant/colors.dart';
import 'package:leqahy_v2/Constant/string.dart';
import 'package:leqahy_v2/Constant/theme.dart';
import 'package:leqahy_v2/Views/Screens/OrderScreen/payment_details.dart';
import 'package:leqahy_v2/Views/Screens/OrderScreen/shipping_details.dart';
import 'package:leqahy_v2/Views/Widget/Order_widget/order_address.dart';

import '../../../Constant/cachHelper.dart';

class DeleviryScreen extends StatefulWidget {
  Function()? onNext;
  int? shipping;
  int? discount;
  int? fees;
  int? subTotal;
  int? total;
  DeleviryScreen({
    Key? key,
    this.onNext,
    this.shipping,
    this.discount,
    this.fees,
    this.subTotal,
    this.total,
  }) : super(key: key);

  @override
  State<DeleviryScreen> createState() => _DeleviryScreenState();
}

class _DeleviryScreenState extends State<DeleviryScreen> {
  String type = '1';
  final formKey = GlobalKey<FormState>();
  FToast toast = FToast();

  @override
  void initState() {
    super.initState();
    toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (OrderData().orderPayType == '') {
      CachHelper.saveData(key: 'Type', value: '1');
    }
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.02),
          Card(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            color: darkGrey,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Card(
                    color: whiteColor,
                    child: RadioListTile(
                        activeColor: mainColor,
                        value: '1',
                        groupValue: type,
                        title: Text(
                          'Shipping Address the same Payment Address'.tr(),
                          style: MyTheme.lightTheme.textTheme.subtitle1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        onChanged: (String? val) {
                          setState(() {
                            type = val!;
                            CachHelper.saveData(key: 'Type', value: type);
                          });
                        }),
                  ),
                  Card(
                    color: whiteColor,
                    child: RadioListTile(
                        activeColor: mainColor,
                        value: '2',
                        groupValue: type,
                        title: Text(
                          'Shipping Address is not the same Payment Address'
                              .tr(),
                          style: MyTheme.lightTheme.textTheme.subtitle1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        onChanged: (String? val) {
                          setState(() {
                            type = val!;
                            CachHelper.saveData(key: 'Type', value: type);
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          shippingAddress(
              size: size,
              shippingTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => ShippingDetails(
                          discount: widget.discount,
                          fees: widget.fees,
                          shipping: widget.shipping,
                          subTotal: widget.subTotal,
                          total: widget.total,
                        )));
              }),
          type == '1'
              ? Container()
              : paymentAddress(
                  size: size,
                  paymentTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => PaymentDetails(
                              discount: widget.discount,
                              fees: widget.fees,
                              shipping: widget.shipping,
                              subTotal: widget.subTotal,
                              total: widget.total,
                            )));
                  }),
          SizedBox(
            height: size.height * 0.01,
          ),
          ElevatedButton(
              onPressed: widget.onNext,
              child: Text(
                'Next Step'.tr(),
                style: MyTheme.lightTheme.textTheme.headline3,
              )),
          SizedBox(
            height: size.height * 0.01,
          ),
        ],
      ),
    ));
  }
}

// updateDetails(
                //     context: context,
                //     title: 'Shipping Details',
                //     size: size,
                //     toast: toast,
                //     firstController: firstController,
                //     lastController: lastController,
                //     companyController: companyController,
                //     addressController: addressController,
                //     subAddressController: subAddressController,
                //     cityController: cityController,
                //     zoneController: zoneController,
                //     onSubmit: () {
                //       if (firstController.text == '' &&
                //           lastController.text == '' &&
                //           companyController.text == '' &&
                //           addressController.text == '' &&
                //           subAddressController.text == '' &&
                //           cityController.text == '' &&
                //           zoneController.text == '' &&
                //           postalController.text == '') {
                //         showBottomToast(
                //           toast: toast,
                //           colors: Colors.red,
                //           icon: Icons.warning,
                //           message: 'Please Compelete your data',
                //         );
                //       } else {
                //         showBottomToast(
                //           toast: toast,
                //           colors: Colors.green,
                //           icon: Icons.check_circle,
                //           message: 'Update Data Success',
                //         );
                //         CachHelper.saveData(
                //             key: 'FirstName', value: firstController.text);
                //         CachHelper.saveData(
                //             key: 'LastName', value: lastController.text);
                //         CachHelper.saveData(
                //             key: 'Company', value: companyController.text);
                //         CachHelper.saveData(
                //             key: 'address', value: addressController.text);
                //         CachHelper.saveData(
                //             key: 'subAddress',
                //             value: subAddressController.text);
                //         CachHelper.saveData(
                //             key: 'city', value: cityController.text);
                //         CachHelper.saveData(
                //             key: 'zone', value: zoneController.text);
                //         CachHelper.saveData(
                //             key: 'postal', value: postalController.text);
                //         firstController.clear();
                //         lastController.clear();
                //         companyController.clear();
                //         addressController.clear();
                //         subAddressController.clear();
                //         cityController.clear();
                //         zoneController.clear();
                //         postalController.clear();
                //         setState(() {});
                //         Navigator.of(context).pop();
                //       }
                //     });
