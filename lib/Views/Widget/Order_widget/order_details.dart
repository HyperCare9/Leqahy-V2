import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';

orderDetails(
    {dynamic size,
    bool? isDelivery,
    bool? isPayment,
    bool? isSummary,
    Function()? onDeliveryTap,
    Function()? onPaymentTap,
    Function()? onSummryTap}) {
  return Row(
    // mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Expanded(
          child: headCartButton(
              size: size,
              img: 'cart1',
              name: 'Delivery'.tr(),
              status: isDelivery,
              onTap: onDeliveryTap)),
      Expanded(
          child: headCartButton(
              size: size,
              img: 'cart2',
              name: 'Payment'.tr(),
              status: isPayment,
              onTap: onPaymentTap)),
      Expanded(
          child: headCartButton(
              size: size,
              img: 'cart3',
              name: 'Confirm'.tr(),
              status: isSummary,
              onTap: onSummryTap)),
    ],
  );
}

headCartButton(
    {dynamic size,
    String? img,
    String? name,
    bool? status,
    Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: status == true ? mainColor : whiteColor, width: 4.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/$img.png'),
          SizedBox(height: size.height * 0.01),
          Text(
            name!,
            style: MyTheme.lightTheme.textTheme.subtitle1!
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}
