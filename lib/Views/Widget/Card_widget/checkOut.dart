import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../Screens/OrderScreen/mainOrder_screen.dart';

import '../../../Constant/theme.dart';
import '../../../Model/cards_model/total_card.dart';
import '../../../Services/Cart_Services/cardsAPI.dart';

checkOutButton() {
  try {
    return FutureBuilder<TotalCartModel>(
        future: CardAPI().getTotal(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return Center(
              child: ElevatedButton(
                  onPressed: () {
                    if (snapShot.data!.checkOutModel!.total! > 0) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => MainOrderScreen(
                                shipping:
                                    snapShot.data!.checkOutModel!.shipping,
                                discount:
                                    snapShot.data!.checkOutModel!.discount,
                                fees: snapShot.data!.checkOutModel!.fees,
                                subTotal:
                                    snapShot.data!.checkOutModel!.subTotal,
                                total: snapShot.data!.checkOutModel!.total,
                              )));
                    }
                  },
                  child: RichText(
                      text: TextSpan(
                          style: MyTheme.lightTheme.textTheme.headline4,
                          children: [
                        TextSpan(text: 'CheckOut'.tr()),
                        snapShot.data!.checkOutModel!.total != 0
                            ? TextSpan(
                                text:
                                    ' (${snapShot.data!.checkOutModel!.total})')
                            : const TextSpan(text: ' (0)'),
                        TextSpan(text: ' LE'.tr())
                      ]))),
            );
          } else {
            return Container();
          }
        });
  } catch (e) {
    print(e);
  }
}
