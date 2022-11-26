// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leqahy_v2/Constant/theme.dart';
import 'package:leqahy_v2/Model/Order_model/order_details_model.dart';
import 'package:leqahy_v2/Services/Order_Services/order_services.dart';
import 'package:leqahy_v2/Views/Widget/General_Widget/loading.dart';
import 'package:leqahy_v2/Views/Widget/Order_widget/customReward.dart';
import 'package:leqahy_v2/Views/Widget/Order_widget/order_product.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/string.dart';
import '../../Widget/General_Widget/buildHeader.dart';

class OneOrderDetails extends StatefulWidget {
  String? orderID;
  OneOrderDetails({
    this.orderID,
  });

  @override
  State<OneOrderDetails> createState() => _OneOrderDetailsState();
}

class _OneOrderDetailsState extends State<OneOrderDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
              Navigator.of(context).pop();
            },
            sufFun: () {}),
        Expanded(
          child: FutureBuilder<List<OrderDetailsModel>>(
            future: OrderAPI().getOrderDetails(
                customerID: '${CustomerData().cusID}',
                languageID:
                    context.locale == const Locale('en', 'US') ? '1' : '2',
                orderID: widget.orderID),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return ListView.builder(
                    itemCount: snapShot.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            orderProductWidget(
                                size: size,
                                orderID: widget.orderID,
                                languageID:
                                    context.locale == const Locale('en', 'US')
                                        ? '1'
                                        : '2'),
                            Center(
                                child: Text(
                              'Custome Data'.tr(),
                              style: MyTheme.lightTheme.textTheme.bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500]),
                            )),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.02),
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.01),
                              decoration: BoxDecoration(
                                  border: Border.all(color: darkGrey),
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  cusReward(
                                      size: size,
                                      title: 'Name'.tr(),
                                      content:
                                          '${snapShot.data![index].firstname} ${snapShot.data![index].lastname}'),
                                  cusReward(
                                      size: size,
                                      title: 'Email'.tr(),
                                      content: snapShot.data![index].email),
                                  cusReward(
                                      size: size,
                                      title: 'Phone'.tr(),
                                      content: snapShot.data![index].telephone)
                                ],
                              ),
                            ),
                            Center(
                                child: Text(
                              'Payment Data'.tr(),
                              style: MyTheme.lightTheme.textTheme.bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500]),
                            )),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.02),
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.01),
                              decoration: BoxDecoration(
                                  border: Border.all(color: darkGrey),
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  cusReward(
                                      size: size,
                                      title: 'Name'.tr(),
                                      content:
                                          '${snapShot.data![index].paymentFirstname} ${snapShot.data![index].paymentLastname}'),
                                  cusReward(
                                      size: size,
                                      title: 'Company'.tr(),
                                      content:
                                          snapShot.data![index].paymentCompany),
                                  cusReward(
                                      size: size,
                                      title: 'Address'.tr(),
                                      content: snapShot
                                          .data![index].paymentAddress1),
                                  cusReward(
                                      size: size,
                                      title: 'Sub Address'.tr(),
                                      content: snapShot
                                          .data![index].paymentAddress2),
                                  cusReward(
                                      size: size,
                                      title: 'City'.tr(),
                                      content:
                                          snapShot.data![index].paymentCity),
                                  cusReward(
                                      size: size,
                                      title: 'PostCode'.tr(),
                                      content: snapShot
                                          .data![index].paymentPostcode),
                                  cusReward(
                                      size: size,
                                      title: 'Zone'.tr(),
                                      content:
                                          snapShot.data![index].paymentZone),
                                  cusReward(
                                      size: size,
                                      title: 'Payment Method'.tr(),
                                      content:
                                          snapShot.data![index].paymentMethod),
                                  cusReward(
                                      size: size,
                                      title: 'Code'.tr(),
                                      content:
                                          snapShot.data![index].paymentCode),
                                ],
                              ),
                            ),
                            Center(
                                child: Text(
                              'Shipping Data'.tr(),
                              style: MyTheme.lightTheme.textTheme.bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500]),
                            )),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.02),
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.01),
                              decoration: BoxDecoration(
                                  border: Border.all(color: darkGrey),
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  cusReward(
                                      size: size,
                                      title: 'Name'.tr(),
                                      content:
                                          '${snapShot.data![index].shippingFirstname} ${snapShot.data![index].shippingLastname}'),
                                  cusReward(
                                      size: size,
                                      title: 'Company'.tr(),
                                      content: snapShot
                                          .data![index].shippingCompany),
                                  cusReward(
                                      size: size,
                                      title: 'Address'.tr(),
                                      content: snapShot
                                          .data![index].shippingAddress1),
                                  cusReward(
                                      size: size,
                                      title: 'Sub Address'.tr(),
                                      content: snapShot
                                          .data![index].shippingAddress2),
                                  cusReward(
                                      size: size,
                                      title: 'City'.tr(),
                                      content:
                                          snapShot.data![index].shippingCity),
                                  cusReward(
                                      size: size,
                                      title: 'PostCode'.tr(),
                                      content: snapShot
                                          .data![index].shippingPostcode),
                                  cusReward(
                                      size: size,
                                      title: 'Zone'.tr(),
                                      content:
                                          snapShot.data![index].shippingZone),
                                  cusReward(
                                      size: size,
                                      title: 'Payment Method'.tr(),
                                      content:
                                          snapShot.data![index].shippingMethod),
                                  cusReward(
                                      size: size,
                                      title: 'Code'.tr(),
                                      content:
                                          snapShot.data![index].shippingCode),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    });
              } else {
                return loading();
              }
            },
          ),
        ),
      ],
    )));
  }
}
