import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leqahy_v2/Constant/initial_route.dart';
import '../../../Constant/colors.dart';
import '../../../Constant/string.dart';
import '../../../Constant/theme.dart';
import 'package:intl/intl.dart' as inital;
import '../../Widget/General_Widget/loading.dart';

import '../../../Model/cards_model/card_model.dart';
import '../../../Model/labvaccine_model/vaccineProduct_model.dart';
import '../../../Model/labvaccine_model/vaccine_model.dart';
import '../../../Services/Cart_Services/cardsAPI.dart';
import '../../../Services/labVaccination_Services/labvaccination_services.dart';
import '../../../ViewModel/Home_ViewModel/homeViewModel.dart';
import '../../../ViewModel/LabVaccination_viewModel/labvaccination_viewmodel.dart';
import '../../Widget/General_Widget/buildToast.dart';
import '../../Widget/General_Widget/pageTitle.dart';
import '../../Widget/Home_Widget/buildDrawer.dart';
import '../../Widget/LabVaccination_Widget/vaccDialog.dart';
import '../../Widget/LabVaccination_Widget/vaccineContent.dart';

class LabVaccinationScreen extends StatefulWidget {
  static String routeName = InitailRoute()
      .route(routeEN: 'Lab Vaccination', routeAR: 'تحصينات المعمل');
  const LabVaccinationScreen({Key? key}) : super(key: key);

  @override
  State<LabVaccinationScreen> createState() => _LabVaccinationScreenState();
}

class _LabVaccinationScreenState extends State<LabVaccinationScreen> {
  Map<String, bool> values = {};
  List<Map<String, dynamic>> subDetails = [];
  VaccinationViewModel vaccinationVM = VaccinationViewModel();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController cusNumberControllor = TextEditingController();
  TextEditingController cusNameControllor = TextEditingController();
  TextEditingController labControllor = TextEditingController();
  TextEditingController countDControllor = TextEditingController();
  TextEditingController dateControllor = TextEditingController();
  TextEditingController resrveControllor = TextEditingController();
  DateTime? date;
  DateTime initialDate = DateTime.now();
  VaccineProductModel? vaccineProductModel;
  FToast toast = FToast();
  List<CardModel> cartList = [];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  HomeViewModel homeVM = HomeViewModel();
  @override
  void initState() {
    super.initState();
    toast.init(context);
    getCard();
    inital.Intl.defaultLocale = 'en';
    cusNameControllor = TextEditingController(
        text: '${CustomerData().cusFirstName} ${CustomerData().cusLastName}');
    cusNumberControllor = TextEditingController(text: CustomerData().cusTele);
    inital.Intl.defaultLocale = 'en';
    dateControllor.text = inital.DateFormat('yyyy-MM-dd').format(initialDate);
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
        child: Form(
      key: formKey,
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
            pageTitle(context: context, size: size, text: 'Lab Vaccine'.tr()),
            SizedBox(height: size.height * 0.02),
            Expanded(
              child: FutureBuilder<List<VaccineModel>>(
                  future: VaccinationAPI().getVaccine(
                      languageId: context.locale == const Locale('en', 'US')
                          ? '1'
                          : '2'),
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      final detected = snapShot.data!
                          .map((e) => e.productTypeName)
                          .toSet()
                          .toList();
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            vaccineContent(
                                size: size,
                                controller: cusNameControllor,
                                text: 'Customer Name'.tr(),
                                hint: 'Customer Name'.tr(),
                                isReadOnly: true,
                                isSuffix: false),
                            vaccineContent(
                                size: size,
                                controller: cusNumberControllor,
                                text: 'Customer Phone'.tr(),
                                hint: 'Customer Phone'.tr(),
                                isReadOnly: true,
                                isSuffix: false),
                            vaccineContent(
                                size: size,
                                controller: labControllor,
                                text: 'Lab'.tr(),
                                hint: 'Lab'.tr(),
                                isReadOnly: false,
                                isSuffix: false),
                            vaccineContent(
                                size: size,
                                controller: countDControllor,
                                text: 'Number'.tr(),
                                hint: 'Number'.tr(),
                                isReadOnly: false,
                                isSuffix: false),
                            vaccineContent(
                              size: size,
                              controller: dateControllor,
                              text: 'Date'.tr(),
                              hint: 'Date'.tr(),
                              isReadOnly: true,
                              isSuffix: true,
                              onPressed: () => pickDate(),
                            ),
                            vaccineContent(
                              size: size,
                              controller: resrveControllor,
                              text: 'Reservation Name'.tr(),
                              hint: 'Reservation Name'.tr(),
                              isReadOnly: false,
                              isSuffix: false,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.010),
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: darkGrey),
                              child: Center(
                                child: Text(
                                  'Transactions'.tr(),
                                  style: MyTheme.lightTheme.textTheme.bodyText2!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              height: size.height * 0.4,
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: detected.length,
                                  itemBuilder: (context, index) {
                                    var named = detected[index];
                                    return ExpansionTile(
                                      title: Text(
                                        named!,
                                        style: MyTheme
                                            .lightTheme.textTheme.subtitle1!
                                            .copyWith(color: Colors.grey[600]),
                                      ),
                                      children: [
                                        ...snapShot.data!
                                            .map((e) => named !=
                                                    e.productTypeName
                                                ? const SizedBox()
                                                : CheckboxListTile(
                                                    controlAffinity: context
                                                                .locale ==
                                                            const Locale(
                                                                'en', 'US')
                                                        ? ListTileControlAffinity
                                                            .platform
                                                        : ListTileControlAffinity
                                                            .leading,
                                                    title: Text(e.name!),
                                                    value:
                                                        values[e.name] ?? false,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        values[e.name!] =
                                                            newValue!;
                                                        subDetails.add({
                                                          "item_name": e.name
                                                        });
                                                      });
                                                      print(subDetails);
                                                    }))
                                            .toSet()
                                            .toList()
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return loading();
                    }
                  }),
            ),
            Center(
              child: InkWell(
                onTap: () async {
                  if (cusNameControllor.text.isEmpty ||
                      cusNumberControllor.text.isEmpty ||
                      labControllor.text.isEmpty ||
                      countDControllor.text.isEmpty ||
                      dateControllor.text.isEmpty ||
                      resrveControllor.text.isEmpty ||
                      subDetails.isEmpty) {
                    vaccDialog(context: context, size: size);
                  } else {
                    vaccineProductModel = await VaccinationAPI()
                        .sendVaccination(
                            cusName: cusNameControllor.text,
                            cusNumber: cusNumberControllor.text,
                            checkCount: countDControllor.text,
                            date: dateControllor.text,
                            labName: labControllor.text,
                            reserveName: resrveControllor.text,
                            details: subDetails);
                    setState(() {
                      if (vaccineProductModel!.msg == 'تم اضافة المنتج بنجاح') {
                        showBottomToast(
                          toast: toast,
                          colors: Colors.green,
                          icon: Icons.check_circle_outline,
                          message: 'Send Success'.tr(),
                        );
                        // cusNameControllor.clear();
                        // cusNumberControllor.clear();
                        countDControllor.clear();
                        dateControllor.clear();
                        labControllor.clear();
                        resrveControllor.clear();
                        subDetails.clear();
                        values.clear();
                      } else {
                        showBottomToast(
                          toast: toast,
                          colors: Colors.red,
                          icon: Icons.warning,
                          message: 'Send Failed'.tr(),
                        );
                      }
                    });
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  height: 35,
                  width: size.width * 0.30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [mainColor, mainColor])),
                  child: Center(
                    child: Text(
                      'Send'.tr(),
                      style: MyTheme.lightTheme.textTheme.headline4,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02)
          ],
        ),
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
      dateControllor.text = inital.DateFormat('yyyy-MM-dd').format(date!);
    });
  }
}
