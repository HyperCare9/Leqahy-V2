import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../Model/Order_model/order_product_model.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';
import '../../../Services/Order_Services/order_services.dart';
import '../General_Widget/loading.dart';
import '../productWidget/noProductWidget.dart';

orderProductWidget(
    {dynamic size,
    String? orderID,
    required String languageID,
    Function()? cancelTap}) {
  return FutureBuilder<List<OrderProductModel>>(
    future:
        OrderAPI().getPrdouctOrder(orderID: orderID, languageID: languageID),
    builder: (context, snapShot) {
      if (snapShot.hasData) {
        return snapShot.data!.isNotEmpty
            ? ListView.builder(
                itemCount: snapShot.data!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        vertical: size.width * 0.02,
                        horizontal: size.height * 0.01),
                    margin: EdgeInsets.symmetric(
                        vertical: size.width * 0.02,
                        horizontal: size.height * 0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: darkGrey, width: 2.0),
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
                        Center(
                            child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          maxRadius: 41,
                          backgroundImage:
                              const AssetImage('assets/images/logoMark.png'),
                          child: CircleAvatar(
                            maxRadius: 27,
                            backgroundColor: whiteColor,
                            backgroundImage: snapShot.data![index].image != ''
                                ? NetworkImage(
                                    'https://leqahyapp.hypercare-eg.com/media/${snapShot.data![index].image}')
                                : const NetworkImage(
                                    'https://leqahyapp.hypercare-eg.com/media/image/notfound/no-order.png'),
                          ),
                        )),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: size.width * 0.02),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapShot.data![index].name!,
                                style: MyTheme.lightTheme.textTheme.subtitle1!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              RichText(
                                  text: TextSpan(
                                      style: MyTheme
                                          .lightTheme.textTheme.subtitle2,
                                      children: [
                                    TextSpan(text: 'Total Price : '.tr()),
                                    TextSpan(text: snapShot.data![index].total)
                                  ])),
                              Divider(
                                color: Colors.grey[500],
                                thickness: 2.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  snapShot.data![index].statusName ==
                                              'Processing' ||
                                          snapShot.data![index].statusName ==
                                              'جاري التجهيز'
                                      ? Card(
                                          color: Colors.orange,
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Text(
                                              snapShot.data![index].statusName!,
                                              style: MyTheme.lightTheme
                                                  .textTheme.subtitle2!
                                                  .copyWith(color: whiteColor),
                                            ),
                                          ),
                                        )
                                      : Card(
                                          color: Colors.red,
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Text(
                                              snapShot.data![index].statusName!,
                                              style: MyTheme.lightTheme
                                                  .textTheme.subtitle2!
                                                  .copyWith(color: whiteColor),
                                            ),
                                          ),
                                        ),
                                  Container()
                                ],
                              ),
                              SizedBox(height: size.height * 0.02)
                            ],
                          ),
                        ))
                      ],
                    ),
                  );
                })
            : noCompanyWidget(message: 'There are no any order'.tr());
      } else {
        return loading();
      }
    },
  );
}
