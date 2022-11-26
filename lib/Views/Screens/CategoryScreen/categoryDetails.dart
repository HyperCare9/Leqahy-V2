// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leqahy_v2/Views/Screens/CategoryScreen/categor_productScreen.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/string.dart';
import '../../../Constant/theme.dart';
import '../../../Model/Product_model/product_details_Model.dart';
import '../../../Model/Product_model/product_images_model.dart';
import '../../../Model/cards_model/add_card_model.dart';
import '../../../Model/cards_model/card_model.dart';
import '../../../Services/Cart_Services/cardsAPI.dart';
import '../../../Services/Prdouct_Services/productAPI.dart';
import '../../../ViewModel/Home_ViewModel/homeViewModel.dart';
import '../../Widget/General_Widget/buildToast.dart';
import '../../Widget/General_Widget/loading.dart';
import '../../Widget/General_Widget/smoothIndicator.dart';
import '../../Widget/Home_Widget/buildDrawer.dart';
import '../../Widget/productWidget/quantityWidget.dart';

class CategoryDetailsScreen extends StatefulWidget {
  String? productID;
  String? productName;
  String? categoryID;
  String? categoryName;
  CategoryDetailsScreen({
    Key? key,
    this.productID,
    this.productName,
    this.categoryID,
    this.categoryName,
  }) : super(key: key);

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  int activeIndex = 0;
  int lenght = 3;
  List<CardModel> cartList = [];
  AddCard? addCard;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  HomeViewModel homeVM = HomeViewModel();
  FToast toast = FToast();

  @override
  void initState() {
    super.initState();
    toast.init(context);
    getCard();
  }

  getCard() async {
    await CardAPI().getCard(languageID: LanguageData().language);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      drawer: Container(
          color: darkGrey,
          width: size.width * 0.60,
          child: DrawerWidget(
            closeDrawwer: () => scaffoldKey.currentState!.closeDrawer(),
          )),
      body: Column(
        children: [
          homeVM.buildAppBar(
              size: size,
              context: context,
              cartLenght: customCardModel.length,
              onMenuTapp: () => scaffoldKey.currentState!.openDrawer(),
              isPre: true,
              isSuf: false,
              preIcon: Icons.arrow_back_ios,
              preColor: mainColor,
              isProduct: false,
              isProductCategory: false,
              preFun: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => CategoryProductScreen(
                          categoryID: widget.categoryID,
                          categoryName: widget.categoryName,
                        )));
              }),
          SizedBox(height: size.height * 0.03),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
            ),
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: mainColor))),
            child: Text(
              widget.productName!,
              style: MyTheme.lightTheme.textTheme.bodyText2,
            ),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(top: size.height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<List<ProductImagesModel>>(
                    future: ProductAPI()
                        .getProductImages(productId: widget.productID),
                    builder: (context, snapShot) {
                      if (snapShot.hasData) {
                        return CarouselSlider.builder(
                          itemCount: snapShot.data!.length,
                          options: CarouselOptions(
                              height: size.height * 0.20,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.easeInOut,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reson) {
                                setState(() {
                                  lenght = snapShot.data!.length;
                                  activeIndex = index;
                                });
                              }),
                          itemBuilder: (context, itemIndex, pageViewIndex) {
                            lenght = snapShot.data!.length;
                            return snapShot.data!.isNotEmpty
                                ? Container(
                                    height: size.height * 0.25,
                                    width: size.width * 0.95,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.005),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                            color: Colors.grey[300]!)),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image.network(
                                          snapShot.data![itemIndex].image!,
                                          fit: BoxFit.fill,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Text('error');
                                          },
                                        )),
                                  )
                                : Container(
                                    height: size.height * 0.25,
                                    width: size.width * 0.95,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.005),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                            color: Colors.grey[300]!)),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image.network(
                                          'https://leqahyshop.hypercare-eg.com/image/catalog/loqa7y/Manufacturer/Medivac.jpeg',
                                          fit: BoxFit.fill,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Text('error');
                                          },
                                        )),
                                  );
                          },
                        );
                      } else {
                        return loading();
                      }
                    }),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Center(
                  child: smoothIndicator(
                      activeIndex: activeIndex,
                      itemCount: lenght < 5 ? lenght : 5),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                FutureBuilder<List<ProductDetailsModel>>(
                    future: ProductAPI().getProductDetails(
                        customerID: CustomerData().cusID.toString(),
                        languageId: context.locale == const Locale('en', 'US')
                            ? '1'
                            : '2',
                        productId: widget.productID),
                    builder: (context, snapShot) {
                      if (snapShot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapShot.data!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.07),
                                    child: Text(
                                      'Description'.tr(),
                                      style: MyTheme
                                          .lightTheme.textTheme.bodyText2,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  snapShot.data![index].productDescription != ''
                                      ? Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.07),
                                          child: Text(
                                            snapShot.data![index]
                                                .productDescription!,
                                            style: MyTheme
                                                .lightTheme.textTheme.subtitle1!
                                                .copyWith(
                                                    color: Colors.black45),
                                            softWrap: true,
                                            overflow: TextOverflow.visible,
                                          ),
                                        )
                                      : Center(
                                          child: Text(
                                            'No Description'.tr(),
                                            style: MyTheme
                                                .lightTheme.textTheme.subtitle1!
                                                .copyWith(
                                                    color: Colors.black45),
                                            softWrap: true,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                  Center(
                                    child: Container(
                                      width: size.width * 0.90,
                                      margin: EdgeInsets.symmetric(
                                          vertical: size.height * 0.02),
                                      padding: const EdgeInsets.all(7.0),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                              text: TextSpan(
                                                  style: MyTheme.lightTheme
                                                      .textTheme.subtitle1,
                                                  children: [
                                                TextSpan(text: 'Price :'.tr()),
                                                TextSpan(
                                                    text: snapShot
                                                        .data![index].price)
                                              ])),
                                          SizedBox(height: size.height * 0.01),
                                          RichText(
                                              text: TextSpan(
                                                  style: MyTheme.lightTheme
                                                      .textTheme.subtitle1,
                                                  children: [
                                                TextSpan(text: 'Model :'.tr()),
                                                TextSpan(
                                                    text: snapShot
                                                        .data![index].model)
                                              ])),
                                          SizedBox(height: size.height * 0.01),
                                          RichText(
                                              text: TextSpan(
                                                  style: MyTheme.lightTheme
                                                      .textTheme.subtitle1,
                                                  children: [
                                                TextSpan(
                                                    text: 'Package :'.tr()),
                                                TextSpan(
                                                    text: snapShot
                                                        .data![index].sku)
                                              ])),
                                          SizedBox(height: size.height * 0.01),
                                          RichText(
                                              text: TextSpan(
                                                  style: MyTheme.lightTheme
                                                      .textTheme.subtitle1,
                                                  children: [
                                                TextSpan(text: 'Dose :'.tr()),
                                                TextSpan(
                                                    text: snapShot
                                                        .data![index].mpn)
                                              ])),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.02),
                                  snapShot.data![index].productChecks == '0'
                                      ? ElevatedButton(
                                          onPressed: () async {
                                            try {
                                              addCard = await CardAPI().addCard(
                                                  productID: snapShot
                                                      .data![index].productId);
                                              setState(() {});
                                              if (addCard!.status == true) {
                                                showBottomToast(
                                                  toast: toast,
                                                  colors: Colors.green,
                                                  icon: Icons
                                                      .check_circle_outline,
                                                  message:
                                                      'Add Product Succuess'
                                                          .tr(),
                                                );
                                                getCard();
                                                setState(() {});
                                              } else {
                                                showBottomToast(
                                                  toast: toast,
                                                  colors: Colors.red,
                                                  icon: Icons.warning,
                                                  message:
                                                      'Add Product Faild'.tr(),
                                                );
                                              }
                                            } catch (e) {
                                              print(e);
                                            }
                                          },
                                          child: Text(
                                            'Add to Cart',
                                            style: MyTheme
                                                .lightTheme.textTheme.subtitle2!
                                                .copyWith(color: whiteColor),
                                          ))
                                      : SizedBox(
                                          width: size.width * 0.55,
                                          child: quantityWidget(
                                              quantity: snapShot
                                                  .data![index].cartQuantity,
                                              onplusTap: () {
                                                if (int.parse(snapShot
                                                        .data![index]
                                                        .cartQuantity!) <
                                                    int.parse(snapShot
                                                        .data![index]
                                                        .mainQuantity!)) {
                                                  CardAPI().updateQuantity(
                                                      productID: snapShot
                                                          .data![index]
                                                          .productId,
                                                      quantity:
                                                          '${int.parse(snapShot.data![index].cartQuantity!) + 1}');
                                                } else {
                                                  showBottomToast(
                                                      toast: toast,
                                                      icon: Icons.warning,
                                                      colors: Colors.red,
                                                      message:
                                                          'this quantity not avaliable in stock'
                                                              .tr());
                                                }

                                                setState(() {});
                                              },
                                              onminTap: () {
                                                if (int.parse(snapShot
                                                        .data![index]
                                                        .cartQuantity!) <=
                                                    1) {
                                                  showBottomToast(
                                                      toast: toast,
                                                      icon: Icons.warning,
                                                      colors: Colors.red,
                                                      message:
                                                          "yon can't minimize quantity less 1"
                                                              .tr());
                                                } else {
                                                  CardAPI().updateQuantity(
                                                      productID: snapShot
                                                          .data![index]
                                                          .productId,
                                                      quantity:
                                                          '${int.parse(snapShot.data![index].cartQuantity!) - 1}');
                                                }
                                                setState(() {});
                                              }),
                                        )
                                ],
                              );
                            });
                      } else {
                        return loading();
                      }
                    })
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
