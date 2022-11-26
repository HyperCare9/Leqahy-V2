// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leqahy_v2/Views/Widget/General_Widget/loading.dart';
import '../../../Constant/colors.dart';
import '../../../Constant/initial_route.dart';
import '../../../Constant/string.dart';
import '../../../Model/Product_model/product_company_model.dart';
import '../../../Model/cards_model/card_model.dart';
import '../../../Services/Cart_Services/cardsAPI.dart';
import '../../../Services/Prdouct_Services/productAPI.dart';
import '../../../ViewModel/Home_ViewModel/homeViewModel.dart';
import '../../Widget/General_Widget/pageTitle.dart';
import '../../Widget/Home_Widget/buildDrawer.dart';
import '../../Widget/productWidget/companyCards.dart';
import '../PrdouctScreen/productsScreen.dart';

class AntisepticsScreen extends StatefulWidget {
  String? classID;
  static String routeName =
      InitailRoute().route(routeEN: 'Antiseptics', routeAR: 'مطهرات');
  AntisepticsScreen({
    Key? key,
    this.classID,
  }) : super(key: key);

  @override
  State<AntisepticsScreen> createState() => _AntisepticsScreenState();
}

class _AntisepticsScreenState extends State<AntisepticsScreen> {
  TextEditingController searchController = TextEditingController();
  List<CardModel> cartList = [];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  HomeViewModel homeVM = HomeViewModel();

  @override
  void initState() {
    super.initState();
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
    var args = ModalRoute.of(context)!.settings.arguments.toString();
    print(args);
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
              onMenuTapp: () => scaffoldKey.currentState!.openDrawer(),
              isPre: true,
              isSuf: false,
              preIcon: Icons.arrow_back_ios,
              preColor: mainColor,
              isProduct: false,
              isProductCategory: false,
              preFun: () {
                getCard();
                Navigator.of(context).pop();
              }),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.11),
          //   child: SizedBox(
          //     height: size.height * 0.06,
          //     child: TextFormField(
          //       controller: searchController,
          //       decoration: InputDecoration(
          //           contentPadding: const EdgeInsets.symmetric(
          //               horizontal: 15.0, vertical: 2.0),
          //           hintText: 'search'.tr(),
          //           hintStyle: MyTheme.lightTheme.textTheme.subtitle1!
          //               .copyWith(color: Colors.grey),
          //           prefixIcon: const Icon(
          //             Icons.search,
          //             color: mainColor,
          //             size: 25,
          //           ),
          //           border: const OutlineInputBorder(
          //             borderSide: BorderSide(
          //               color: mainColor,
          //               width: 3.0,
          //             ),
          //             borderRadius: BorderRadius.all(
          //               Radius.circular(25.0),
          //             ),
          //           )),
          //     ),
          //   ),
          // ),
          SizedBox(height: size.height * 0.02),
          Center(
            child: Image.asset(
              'assets/images/antisep.png',
              height: size.height * 0.25,
              width: size.width * 0.85,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          pageTitle(context: context, size: size, text: 'Antiseptics'.tr()),
          SizedBox(
            height: size.height * 0.05,
          ),
          Expanded(
            child: FutureBuilder<List<ProductCompanyModel>>(
                future: ProductAPI().getAllCompanies(
                    classID: args,
                    languageID:
                        context.locale == const Locale('en', 'US') ? '1' : '2'),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    return GridView.builder(
                        shrinkWrap: true,
                        // scrollDirection: Axis.horizontal,
                        itemCount: snapShot.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 1.0,
                          mainAxisSpacing: 1.0,
                        ),
                        itemBuilder: (context, index) {
                          return companyCard(
                            size: size,
                            backgroundImage: snapShot.data![index].image != ''
                                ? NetworkImage(snapShot.data![index].image!)
                                : const NetworkImage(
                                    'https://leqahyapp.hypercare-eg.com/media/image/notfound/no-company.png'),
                            text: snapShot.data![index].name,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => ProductsScreen(
                                        companyID: snapShot
                                            .data![index].manufacturerId
                                            .toString(),
                                        companyName: snapShot.data![index].name,
                                      )));
                            },
                          );
                        });
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
