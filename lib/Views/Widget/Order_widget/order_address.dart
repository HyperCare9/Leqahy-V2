import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'updateDetails.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/string.dart';
import '../../../Constant/theme.dart';

customerAddress({dynamic size}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(
        vertical: size.height * 0.01, horizontal: size.width * 0.03),
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 1.0), //(x,y)
          blurRadius: 6.0,
        ),
      ],
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
        child: Card(
          color: subColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'Customer Details',
              style: MyTheme.lightTheme.textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: size.height * 0.01,
      ),
      Text('${CustomerData().cusFirstName} ${CustomerData().cusLastName}',
          style: MyTheme.lightTheme.textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.bold)),
      SizedBox(
        height: size.height * 0.01,
      ),
      Text('${CustomerData().cusTele}',
          style: MyTheme.lightTheme.textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.bold)),
      SizedBox(
        height: size.height * 0.01,
      ),
      Text('${CustomerData().cusEmail}',
          style: MyTheme.lightTheme.textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.bold)),
    ]),
  );
}

shippingAddress({dynamic size, Function()? shippingTap}) {
  return Card(
    elevation: 0.0,
    margin: EdgeInsets.symmetric(
        vertical: size.height * 0.01, horizontal: size.width * 0.03),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: const BorderSide(color: darkGrey, width: 2.0)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
        child: SizedBox(
          width: double.infinity,
          child: Card(
            color: darkGrey,
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(6.0)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipping Details'.tr(),
                    textAlign: TextAlign.center,
                    style: MyTheme.lightTheme.textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: shippingTap,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.edit,
                          color: mainColor,
                          size: 20,
                        ),
                        SizedBox(width: size.width * 0.01),
                        Text(
                          'Edit'.tr(),
                          style: MyTheme.lightTheme.textTheme.subtitle1!
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
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
      SizedBox(
        height: size.height * 0.01,
      ),
    ]),
  );
}

paymentAddress({dynamic size, Function()? paymentTap}) {
  return Card(
    elevation: 0.0,
    margin: EdgeInsets.symmetric(
        vertical: size.height * 0.01, horizontal: size.width * 0.03),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: const BorderSide(color: darkGrey, width: 2.0)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
        child: SizedBox(
          width: double.infinity,
          child: Card(
            color: darkGrey,
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(6.0)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment Details'.tr(),
                    textAlign: TextAlign.center,
                    style: MyTheme.lightTheme.textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: paymentTap,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.edit,
                          color: mainColor,
                          size: 20,
                        ),
                        SizedBox(width: size.width * 0.01),
                        Text(
                          'Edit'.tr(),
                          style: MyTheme.lightTheme.textTheme.subtitle1!
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
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
      SizedBox(
        height: size.height * 0.01,
      ),
      // Center(
      //   child: InkWell(
      //     onTap: paymentTap,
      //     child: Card(
      //       margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      //       shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(20.0),
      //           side: const BorderSide(color: mainColor)),
      //       child: Padding(
      //         padding: EdgeInsets.symmetric(
      //             horizontal: size.width * 0.05, vertical: size.height * 0.005),
      //         child: Text(
      //           'Edit',
      //           style: MyTheme.lightTheme.textTheme.headline4!
      //               .copyWith(fontWeight: FontWeight.bold, color: mainColor),
      //         ),
      //       ),
      //     ),
      //   ),
      // )
    ]),
  );
}

cusDetail({dynamic size, String? title, String? content}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Text(title!,
              style: MyTheme.lightTheme.textTheme.subtitle1!
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          width: double.infinity,
          child: Card(
            color: lightGrey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(content!,
                  style: MyTheme.lightTheme.textTheme.subtitle1!
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
        )
      ],
    ),
  );
}
