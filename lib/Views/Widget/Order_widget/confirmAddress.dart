import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'order_address.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/string.dart';
import '../../../Constant/theme.dart';

confirmShippingAddress({dynamic size}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Center(
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: darkGrey,
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(6.0)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'Shipping Details'.tr(),
              textAlign: TextAlign.center,
              style: MyTheme.lightTheme.textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
    SizedBox(
      height: size.height * 0.01,
    ),
    cusDetail(
        size: size,
        title: 'Name'.tr(),
        content:
            '${ShippingData().firstName ??= CustomerData().cusFirstName} ${ShippingData().lastName ??= CustomerData().cusLastName}'),
    SizedBox(
      height: size.height * 0.01,
    ),
    cusDetail(
        size: size,
        title: 'Company'.tr(),
        content: ShippingData().company ??= 'Medivac'),
    SizedBox(
      height: size.height * 0.01,
    ),
    cusDetail(
        size: size,
        title: 'Addess'.tr(),
        content: ShippingData().address ??= 'El sheik zaied'),
    SizedBox(
      height: size.height * 0.01,
    ),
    cusDetail(
        size: size,
        title: 'Sub Address'.tr(),
        content: ShippingData().subAddress ??= 'Vilaa 9'),
    SizedBox(
      height: size.height * 0.01,
    ),
    cusDetail(
        size: size,
        title: 'City'.tr(),
        content: ShippingData().city ??= '6 October'),
    SizedBox(
      height: size.height * 0.01,
    ),
    cusDetail(
        size: size,
        title: 'Zone'.tr(),
        content: ShippingData().zone ??= 'N 3th'),
    SizedBox(
      height: size.height * 0.01,
    ),
    cusDetail(
        size: size,
        title: 'PostCode'.tr(),
        content: ShippingData().postal ??= '005678'),
  ]);
}

confirmPaymentAddress({dynamic size}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Center(
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: darkGrey,
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(6.0)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'Payment Details'.tr(),
              textAlign: TextAlign.center,
              style: MyTheme.lightTheme.textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
    SizedBox(
      height: size.height * 0.01,
    ),
    cusDetail(
        size: size,
        title: 'Name'.tr(),
        content:
            '${PaymentData().firstName ??= CustomerData().cusFirstName} ${PaymentData().lastName ??= CustomerData().cusLastName}'),
    SizedBox(
      height: size.height * 0.01,
    ),
    cusDetail(
        size: size,
        title: 'Company'.tr(),
        content: PaymentData().company ??= 'Medivac'),
    SizedBox(
      height: size.height * 0.01,
    ),
    cusDetail(
        size: size,
        title: 'Addess'.tr(),
        content: PaymentData().address ??= 'El sheik zaied'),
    SizedBox(
      height: size.height * 0.01,
    ),
    cusDetail(
        size: size,
        title: 'Sub Address'.tr(),
        content: PaymentData().subAddress ??= 'Vilaa 9'),
    SizedBox(
      height: size.height * 0.01,
    ),
    cusDetail(
        size: size,
        title: 'City'.tr(),
        content: PaymentData().city ??= '6 October'),
    SizedBox(
      height: size.height * 0.01,
    ),
    cusDetail(
        size: size,
        title: 'Zone'.tr(),
        content: PaymentData().zone ??= 'N 3th'),
    SizedBox(
      height: size.height * 0.01,
    ),
    cusDetail(
        size: size,
        title: 'PostCode'.tr(),
        content: PaymentData().postal ??= '005678'),
  ]);
}
