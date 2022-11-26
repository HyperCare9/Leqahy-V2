// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leqahy_v2/Model/cards_model/card_model.dart';
import 'package:leqahy_v2/Model/cards_model/remove_card_model.dart';
import 'package:leqahy_v2/Model/cards_model/remove_item_model.dart';
import 'package:leqahy_v2/Services/Cart_Services/cardsAPI.dart';
import 'package:leqahy_v2/ViewModel/Card_ViewModel/cart_viewmodel.dart';
import 'package:leqahy_v2/Views/Screens/CategoryScreen/categor_productScreen.dart';
import 'package:leqahy_v2/Views/Screens/PrdouctScreen/productsScreen.dart';
import 'package:leqahy_v2/Views/Widget/Card_widget/cartHeader.dart';
import 'package:leqahy_v2/Views/Widget/Card_widget/checkOut.dart';
import 'package:leqahy_v2/Views/Widget/Card_widget/noItemWidget.dart';
import 'package:leqahy_v2/Views/Widget/General_Widget/loading.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/string.dart';
import '../../Widget/General_Widget/buildHeader.dart';
import '../../Widget/General_Widget/buildToast.dart';
import '../../Widget/productWidget/quantityWidget.dart';
import '../PrdouctScreen/productDetailsScreen.dart';

class CardScreen extends StatefulWidget {
  bool isProduct;
  bool isProductCategory;
  String? companyID;
  String? companyName;
  String? categoryID;
  String? categoryName;
  CardScreen({
    Key? key,
    required this.isProduct,
    required this.isProductCategory,
    this.companyID,
    this.companyName,
    this.categoryID,
    this.categoryName,
  }) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  RemoveItemModel? removeItemModel;
  RemoveCartModel? removeCartModel;
  FToast toast = FToast();
  int? number;
  int? largest;

  @override
  void initState() {
    super.initState();
    toast.init(context);
  }

  getCard() async {
    await CardAPI().getCard(languageID: LanguageData().language);
    if (mounted) {
      setState(() {});
    }
  }

  CartViewModel cartViewModel = CartViewModel();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildcustomHeader(
              size: size,
              context: context,
              preColor: mainColor,
              sufColor: mainColor,
              sufIcon: Icons.delete_sweep_outlined,
              preIcon: Icons.arrow_back_ios,
              preFun: () {
                if (widget.isProduct == true) {
                  getCard();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => ProductsScreen(
                            companyID: widget.companyID,
                            companyName: widget.companyName,
                          )));
                } else if (widget.isProductCategory == true) {
                  getCard();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => CategoryProductScreen(
                            categoryID: widget.categoryID,
                            categoryName: widget.categoryName,
                          )));
                } else {
                  getCard();
                  Navigator.of(context).pop();
                }
              },
              sufFun: () async {
                removeCartModel = await CardAPI().removeAllCard();
                setState(() {});
                if (removeCartModel!.status == true) {
                  showBottomToast(
                    toast: toast,
                    colors: Colors.green,
                    icon: Icons.check_circle_outline,
                    message: 'Remove all Item Succuess',
                  );
                } else {
                  showBottomToast(
                    toast: toast,
                    colors: Colors.red,
                    icon: Icons.warning,
                    message: 'Remove all Item Faild',
                  );
                }
              }),
          cartTitel(size: size),
          SizedBox(height: size.height * 0.02),
          Expanded(
            child: FutureBuilder<List<CardModel>>(
                future: CardAPI().getCard(
                    languageID:
                        context.locale == const Locale('en', 'US') ? '1' : '2'),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    return snapShot.data!.isNotEmpty
                        ? ListView.builder(
                            itemCount: snapShot.data!.length,
                            itemBuilder: (context, index) {
                              return cartViewModel.productCard(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                ProductDetailsScreen(
                                                  isCart: true,
                                                  productID: snapShot
                                                      .data![index].productId,
                                                  productName: snapShot
                                                      .data![index].productName,
                                                  companyID: widget.companyID,
                                                  companyName:
                                                      widget.companyName,
                                                )));
                                  },
                                  productName:
                                      snapShot.data![index].productName,
                                  size: size,
                                  productPrice: snapShot.data![index].price,
                                  quantity: snapShot.data![index].quantity,
                                  productImage: snapShot.data![index].image,
                                  removeTap: () async {
                                    removeItemModel = await CardAPI()
                                        .removeItem(
                                            productID: snapShot
                                                .data![index].productId);
                                    setState(() {});
                                    if (removeItemModel!.status == true) {
                                      showBottomToast(
                                        toast: toast,
                                        colors: Colors.green,
                                        icon: Icons.check_circle_outline,
                                        message: 'Remove Item Succuess'.tr(),
                                      );
                                    } else {
                                      showBottomToast(
                                        toast: toast,
                                        colors: Colors.red,
                                        icon: Icons.warning,
                                        message: 'Remove Item Faild'.tr(),
                                      );
                                    }
                                  },
                                  quantityWidget: SizedBox(
                                      width: size.width * 0.4,
                                      child: quantityWidget(
                                          quantity:
                                              snapShot.data![index].quantity,
                                          onplusTap: () {
                                            if (int.parse(snapShot
                                                    .data![index].quantity!) <
                                                int.parse(snapShot.data![index]
                                                    .mainQuantity!)) {
                                              CardAPI().updateQuantity(
                                                  productID: snapShot
                                                      .data![index].productId,
                                                  quantity:
                                                      '${int.parse(snapShot.data![index].quantity!) + 1}');
                                            } else {
                                              showBottomToast(
                                                  toast: toast,
                                                  icon: Icons.warning,
                                                  colors: Colors.red,
                                                  message:
                                                      'this quantity not avaliable in stock');
                                            }

                                            setState(() {});
                                          },
                                          onminTap: () {
                                            if (int.parse(snapShot
                                                    .data![index].quantity!) <=
                                                1) {
                                              showBottomToast(
                                                  toast: toast,
                                                  icon: Icons.warning,
                                                  colors: Colors.red,
                                                  message:
                                                      'yon can\'t minimize quantity less 1');
                                            } else {
                                              CardAPI().updateQuantity(
                                                  productID: snapShot
                                                      .data![index].productId,
                                                  quantity:
                                                      '${int.parse(snapShot.data![index].quantity!) - 1}');
                                            }
                                            setState(() {});
                                          })));
                            })
                        : noCartItem();
                  } else {
                    return loading();
                  }
                }),
          ),
          checkOutButton()
        ],
      ),
    ));
  }
}



  // Expanded(
  //                                             child: Padding(
  //                                                 padding:
  //                                                     const EdgeInsets.all(3.0),
  //                                                 child: Row(
  //                                                   mainAxisAlignment:
  //                                                       MainAxisAlignment
  //                                                           .spaceBetween,
  //                                                   children: [
  //                                                     cartButton(
  //                                                         onTap: () async {
  //                                                           if (int.parse(snapShot
  //                                                                   .data![
  //                                                                       index]
  //                                                                   .quantity!) >
  //                                                               1) {
  //                                                             await CardAPI().updateQuantity(
  //                                                                 productID: snapShot
  //                                                                     .data![
  //                                                                         index]
  //                                                                     .productId,
  //                                                                 quantity: (int.parse(snapShot
  //                                                                             .data![index]
  //                                                                             .quantity!) -
  //                                                                         1)
  //                                                                     .toString());
  //                                                           } else {
  //                                                             return;
  //                                                           }
  //                                                           setState(() {});
  //                                                         },
  //                                                         icon: Icons.remove),
  //                                                     Expanded(
  //                                                       child: Text(
  //                                                         '${snapShot.data![index].quantity}',
  //                                                         style: MyTheme
  //                                                             .lightTheme
  //                                                             .textTheme
  //                                                             .subtitle1,
  //                                                         overflow: TextOverflow
  //                                                             .visible,
  //                                                         softWrap: true,
  //                                                         textAlign:
  //                                                             TextAlign.center,
  //                                                         maxLines: 1,
  //                                                       ),
  //                                                     ),
  //                                                     cartButton(
  //                                                         onTap: () async {
  //                                                           if (int.parse(snapShot
  //                                                                   .data![
  //                                                                       index]
  //                                                                   .mainQuantity!) >
  //                                                               int.parse(snapShot
  //                                                                   .data![
  //                                                                       index]
  //                                                                   .quantity!)) {
  //                                                             await CardAPI().updateQuantity(
  //                                                                 productID: snapShot
  //                                                                     .data![
  //                                                                         index]
  //                                                                     .productId,
  //                                                                 quantity: (int.parse(snapShot
  //                                                                             .data![index]
  //                                                                             .quantity!) +
  //                                                                         1)
  //                                                                     .toString());
  //                                                             setState(() {});
  //                                                           } else {
  //                                                             showBottomToast(
  //                                                               toast: toast,
  //                                                               colors:
  //                                                                   Colors.red,
  //                                                               icon: Icons
  //                                                                   .warning,
  //                                                               message:
  //                                                                   'This Quantity not avaliabel',
  //                                                             );
  //                                                             return;
  //                                                           }
  //                                                         },
  //                                                         icon: Icons.add)
  //                                                   ],
  //                                                 )),
  //                                           ),