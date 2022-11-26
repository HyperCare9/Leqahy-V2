// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';

class PaymentScreen extends StatefulWidget {
  int? shipping;
  int? discount;
  int? fees;
  int? subTotal;
  int? total;
  Function()? onProceed;
  PaymentScreen({
    Key? key,
    this.shipping,
    this.discount,
    this.fees,
    this.subTotal,
    this.total,
    this.onProceed,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String type = '1';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          Card(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            color: darkGrey,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                  color: whiteColor,
                  child: RadioListTile(
                      value: '1',
                      groupValue: type,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cach on Delivery'.tr(),
                            style: MyTheme.lightTheme.textTheme.subtitle1!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Image.asset('assets/images/cart1.png')
                        ],
                      ),
                      activeColor: mainColor,
                      onChanged: (String? val) {
                        setState(() {
                          type = val!;
                        });
                      })),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Card(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            color: mainColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                      child: SizedBox(
                          height: size.height * 0.05,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Enter you Voucher'.tr(),
                                hintStyle: MyTheme
                                    .lightTheme.textTheme.subtitle1!
                                    .copyWith(color: Colors.grey),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 0.0),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                )),
                          ))),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: customBlue),
                      onPressed: () {},
                      child: Text(
                        'Apply'.tr(),
                        style: MyTheme.lightTheme.textTheme.headline3,
                      )),
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.height * 0.02,
          ),
          Card(
            margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.03, vertical: size.height * 0.02),
            color: darkGrey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: const Divider(
              color: Colors.grey,
              thickness: 2.0,
              height: 4.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'Total'.tr(),
                  textAlign: TextAlign.center,
                  style: MyTheme.lightTheme.textTheme.bodyText2!
                      .copyWith(fontWeight: FontWeight.bold, color: customBlue),
                )),
                Expanded(
                    child: Text(
                  widget.total.toString(),
                  textAlign: TextAlign.center,
                  style: MyTheme.lightTheme.textTheme.bodyText2!
                      .copyWith(fontWeight: FontWeight.bold, color: customBlue),
                )),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          ElevatedButton(
              onPressed: widget.onProceed,
              child: Text(
                'Proceed to confirm'.tr(),
                style: MyTheme.lightTheme.textTheme.headline3,
              ))
        ],
      ),
    ));
  }
}

cusRow({String? title, String? content}) {
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
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: MyTheme.lightTheme.textTheme.subtitle1!
                        .copyWith(fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(text: content),
                      const TextSpan(text: ' '),
                      TextSpan(text: ' LE'.tr())
                    ])))
      ],
    ),
  );
}

// RadioListTile(
//                     activeColor: mainColor,
//                     value: '1',
//                     groupValue: type,
//                     title: Text(
//                       'Shipping Address the same Payment Address',
//                       style: MyTheme.lightTheme.textTheme.subtitle1!
//                           .copyWith(fontWeight: FontWeight.bold),
//                     ),
//                     onChanged: (String? val) {
//                       setState(() {
//                         type = val!;
//                         CachHelper.saveData(key: 'Type', value: type);
//                       });
//                     }),
