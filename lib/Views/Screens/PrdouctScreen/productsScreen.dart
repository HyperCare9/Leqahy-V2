import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Constant/string.dart';
import '../../../Model/Product_model/product_model.dart';
import '../../../Services/Cart_Services/cardsAPI.dart';
import '../../../Services/Prdouct_Services/productAPI.dart';
import 'productDetailsScreen.dart';
import '../../Widget/General_Widget/loading.dart';
import '../../Widget/productWidget/companyName.dart';
import '../../Widget/productWidget/noProductWidget.dart';
import '../../Widget/productWidget/productSearch.dart';
import '../../Widget/productWidget/quantityWidget.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';
import '../../../Model/cards_model/add_card_model.dart';
import '../../../Model/cards_model/card_model.dart';
import '../../../ViewModel/Home_ViewModel/homeViewModel.dart';
import '../../Widget/General_Widget/buildToast.dart';
import '../../Widget/Home_Widget/buildDrawer.dart';

class ProductsScreen extends StatefulWidget {
  String? companyID;
  String? companyName;
  ProductsScreen({
    Key? key,
    this.companyID,
    this.companyName,
  }) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  TextEditingController searchController = TextEditingController();
  TextEditingController countController = TextEditingController();
  AddCard? addCard;
  FToast toast = FToast();
  List<CardModel> cartList = [];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  HomeViewModel homeVM = HomeViewModel();

  @override
  void initState() {
    super.initState();
    countController = TextEditingController(text: '0');
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          homeVM.buildAppBar(
              size: size,
              context: context,
              cartLenght: customCardModel.length,
              companyID: widget.companyID,
              companyName: widget.companyName,
              onMenuTapp: () => scaffoldKey.currentState!.openDrawer(),
              isPre: true,
              isSuf: false,
              isProduct: true,
              isProductCategory: false,
              preIcon: Icons.arrow_back_ios,
              preColor: mainColor,
              preFun: () {
                Navigator.of(context).pop();
              }),
          // productSearch(size: size, searchController: searchController),
          SizedBox(height: size.height * 0.04),
          companyName(size: size, companyName: widget.companyName),
          SizedBox(height: size.height * 0.02),
          Expanded(
            child: FutureBuilder<List<ProductModel>>(
                future: ProductAPI().getAllProduct(
                    companyID: widget.companyID,
                    languageID:
                        context.locale == const Locale('en', 'US') ? '1' : '2'),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    return snapShot.data!.isNotEmpty
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02,
                                vertical: size.height * 0.01),
                            child: GridView.builder(
                                itemCount: snapShot.data!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 0.64),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      ProductAPI().updateProductView(
                                          customerID:
                                              CustomerData().cusID.toString(),
                                          productID:
                                              snapShot.data![index].productId);
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  ProductDetailsScreen(
                                                    isCart: false,
                                                    productID: snapShot
                                                        .data![index].productId,
                                                    productName: snapShot
                                                        .data![index].name,
                                                    companyID: widget.companyID,
                                                    companyName:
                                                        widget.companyName,
                                                  )));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                          // color: Colors.grey[100],
                                          border: Border.all(
                                              color: subColor, width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(16.0)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Card(
                                                elevation: 0.0,
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    '- 0%',
                                                    style: MyTheme.lightTheme
                                                        .textTheme.subtitle2!
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                              ),
                                              Card(
                                                color: Colors.grey[100],
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.0),
                                                ),
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: RichText(
                                                        text: TextSpan(
                                                            style: MyTheme
                                                                .lightTheme
                                                                .textTheme
                                                                .subtitle2!
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                            children: [
                                                          TextSpan(
                                                              text: 'Views '
                                                                  .tr()),
                                                          TextSpan(
                                                              text:
                                                                  '(${snapShot.data![index].viewed!})')
                                                        ]))),
                                              )
                                            ],
                                          ),
                                          Container(
                                            height: size.height * 0.17,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: snapShot.data![index]
                                                                .image !=
                                                            ''
                                                        ? NetworkImage(snapShot
                                                            .data![index]
                                                            .image!)
                                                        : const NetworkImage(
                                                            'https://leqahyapp.hypercare-eg.com/media/image/notfound/no-product.png'))),
                                          ),
                                          Text(
                                            snapShot.data![index].name!,
                                            style: MyTheme
                                                .lightTheme.textTheme.subtitle1,
                                            overflow: TextOverflow.visible,
                                            softWrap: true,
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                          ),
                                          snapShot.data![index].productChecks ==
                                                  '0'
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: RichText(
                                                          text: TextSpan(
                                                              style: MyTheme
                                                                  .lightTheme
                                                                  .textTheme
                                                                  .subtitle1,
                                                              children: [
                                                            TextSpan(
                                                                text: snapShot
                                                                    .data![
                                                                        index]
                                                                    .price),
                                                            TextSpan(
                                                                text:
                                                                    ' LE'.tr())
                                                          ])),
                                                    ),
                                                    snapShot.data![index]
                                                                .quantity !=
                                                            '0'
                                                        ? InkWell(
                                                            onTap: () async {
                                                              try {
                                                                addCard = await CardAPI().addCard(
                                                                    productID: snapShot
                                                                        .data![
                                                                            index]
                                                                        .productId);
                                                                setState(() {});
                                                                if (addCard!
                                                                        .status ==
                                                                    true) {
                                                                  showBottomToast(
                                                                    toast:
                                                                        toast,
                                                                    colors: Colors
                                                                        .green,
                                                                    icon: Icons
                                                                        .check_circle_outline,
                                                                    message:
                                                                        'Add Product Succuess'
                                                                            .tr(),
                                                                  );
                                                                  getCard();
                                                                  setState(
                                                                      () {});
                                                                } else {
                                                                  showBottomToast(
                                                                    toast:
                                                                        toast,
                                                                    colors:
                                                                        Colors
                                                                            .red,
                                                                    icon: Icons
                                                                        .warning,
                                                                    message:
                                                                        'Add Product Faild'
                                                                            .tr(),
                                                                  );
                                                                }
                                                              } catch (e) {
                                                                print(e);
                                                              }
                                                            },
                                                            child: Card(
                                                                color:
                                                                    mainColor,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            6.0)),
                                                                child:
                                                                    const Padding(
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                                3.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .shopping_cart_outlined,
                                                                          size:
                                                                              20,
                                                                          color:
                                                                              whiteColor,
                                                                        ))),
                                                          )
                                                        : const SizedBox(),
                                                  ],
                                                )
                                              : RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                      style: MyTheme.lightTheme
                                                          .textTheme.subtitle1,
                                                      children: [
                                                        TextSpan(
                                                            text: snapShot
                                                                .data![index]
                                                                .price),
                                                        TextSpan(
                                                            text: ' LE'.tr())
                                                      ])),
                                          snapShot.data![index].productChecks ==
                                                  '1'
                                              ? quantityWidget(
                                                  quantity: snapShot
                                                      .data![index]
                                                      .cartQuantity,
                                                  onplusTap: () {
                                                    if (int.parse(snapShot
                                                            .data![index]
                                                            .cartQuantity!) <
                                                        int.parse(snapShot
                                                            .data![index]
                                                            .quantity!)) {
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
                                                  })
                                              : const SizedBox()
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : noCompanyWidget(
                            message: 'There is no item for this company'.tr());
                  } else {
                    return loading();
                  }
                }),
          )
        ],
      ),
    ));
  }
}
