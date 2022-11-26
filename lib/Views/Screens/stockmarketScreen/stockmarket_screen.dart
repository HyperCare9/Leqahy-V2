import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as inital;
import '../../../Constant/initial_route.dart';
import '../../../Constant/theme.dart';
import '../../../Model/stockMarket_model/stockMarket_model.dart';
import '../../../Services/StockMarket_Services/stockMarket_services.dart';
import '../../../ViewModel/StockMarket_ViewModel/stockmarket_viewmodel.dart';
import '../../Widget/General_Widget/loading.dart';
import '../../Widget/stockMarket_Widget/itemsCard.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/string.dart';
import '../../../Model/cards_model/card_model.dart';
import '../../../Services/Cart_Services/cardsAPI.dart';
import '../../../ViewModel/Home_ViewModel/homeViewModel.dart';
import '../../Widget/General_Widget/pageTitle.dart';
import '../../Widget/Home_Widget/buildDrawer.dart';

class StockMarketScreen extends StatefulWidget {
  static String routeName =
      InitailRoute().route(routeEN: 'Stockmarket', routeAR: 'البورصه');
  const StockMarketScreen({Key? key}) : super(key: key);

  @override
  State<StockMarketScreen> createState() => _StockMarketScreenState();
}

class _StockMarketScreenState extends State<StockMarketScreen> {
  StockMarketViewModel stockMarketVM = StockMarketViewModel();
  DateTime initialDate = DateTime.now();
  DateTime? date;
  TextEditingController dateController = TextEditingController();
  List<CardModel> cartList = [];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  HomeViewModel homeVM = HomeViewModel();

  @override
  void initState() {
    super.initState();
    inital.Intl.defaultLocale = 'en';
    dateController.text = inital.DateFormat('yyyy-MM-dd').format(initialDate);
    getCard();
  }

  getCard() async {
    cartList = await CardAPI().getCard(languageID: LanguageData().language);
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
              cartLenght: cartList.length,
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
          pageTitle(context: context, size: size, text: 'Stock Market'.tr()),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.03, horizontal: size.width * 0.15),
            child: SizedBox(
              height: 40,
              child: TextFormField(
                controller: dateController,
                readOnly: true,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 15.0),
                    hintText: 'select date',
                    suffixIcon: IconButton(
                        onPressed: () {
                          pickDate();
                        },
                        icon: const Icon(
                          Icons.date_range,
                          color: mainColor,
                        ))),
              ),
            ),
          ),
          stockMarketVM.stockCategory(
            size: size,
            onTapChicks: () {
              setState(() {
                stockMarketVM.type = 'كتاكيت';
              });
            },
            onTapFeed: () {
              setState(() {
                stockMarketVM.type = 'علف';
              });
            },
            onTapEggs: () {
              setState(() {
                stockMarketVM.type = 'بيض';
              });
            },
            onTapMeet: () {
              setState(() {
                stockMarketVM.type = 'لحم';
              });
            },
          ),
          Expanded(
              child: FutureBuilder<List<StockMarketModel>>(
                  future: StockAPI().fetchStockData(
                      date: dateController.text, cateName: stockMarketVM.type),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return itemsCard(
                                    size: size,
                                    context: context,
                                    companyName:
                                        snapshot.data![index].companyName,
                                    price1: snapshot.data![index].price,
                                    unit: snapshot.data![index].priceUnit,
                                    product1: snapshot.data![index].dynasty,
                                    checks: snapshot.data![index].borsaChecks);
                              })
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                                  const SizedBox(height: 7.0),
                                  Text(
                                    'There is no data for this date'.tr(),
                                    style:
                                        MyTheme.lightTheme.textTheme.subtitle1,
                                  ),
                                ],
                              ),
                            );
                    } else {
                      return loading();
                    }
                  }))
        ],
      ),
    ));
  }

  Future pickDate() async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 3),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDatePickerMode: DatePickerMode.day,
    );
    if (newDate == null) {
      return;
    }
    setState(() {
      date = newDate;
      dateController.text = inital.DateFormat('yyyy-MM-dd').format(date!);
    });
  }
}
