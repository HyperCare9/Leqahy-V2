// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../Constant/cachHelper.dart';
import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';
import '../../../Model/Zone_model/zone_model.dart';
import '../../../Services/Zone_services/zone_services.dart';
import '../../Widget/General_Widget/buildHeader.dart';
import '../../Widget/General_Widget/buildToast.dart';
import '../../Widget/General_Widget/loading.dart';
import '../../Widget/Order_widget/detRow.dart';
import 'mainOrder_screen.dart';

class PaymentDetails extends StatefulWidget {
  int? shipping;
  int? discount;
  int? fees;
  int? subTotal;
  int? total;
  PaymentDetails({
    Key? key,
    this.shipping,
    this.discount,
    this.fees,
    this.subTotal,
    this.total,
  }) : super(key: key);

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController subAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zoneController = TextEditingController();
  TextEditingController postalController = TextEditingController();
  FToast toast = FToast();
  String zoneName = 'Al Jizah';
  String zoneID = '1008';
  String zoneCode = 'JZH';

  @override
  void initState() {
    super.initState();
    toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    zoneController = TextEditingController(text: zoneName);
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          buildcustomHeader(
              context: context,
              size: size,
              preColor: mainColor,
              sufColor: Colors.transparent,
              sufIcon: Icons.arrow_back_ios,
              preIcon: Icons.highlight_remove,
              preFun: () {
                Navigator.of(context).pop();
              },
              sufFun: () {}),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03, vertical: size.height * 0.02),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.02),
                  Center(
                      child: Text(
                    'Payment Details'.tr(),
                    style: MyTheme.lightTheme.textTheme.bodyText1!
                        .copyWith(fontWeight: FontWeight.bold),
                  )),
                  SizedBox(height: size.height * 0.02),
                  detRow(
                      size: size,
                      title: 'First Name'.tr(),
                      hint: 'First Name'.tr(),
                      controller: firstController),
                  SizedBox(height: size.height * 0.02),
                  detRow(
                      size: size,
                      title: 'Last Name'.tr(),
                      hint: 'Last Name'.tr(),
                      controller: lastController),
                  SizedBox(height: size.height * 0.02),
                  detRow(
                      size: size,
                      title: 'Company Name'.tr(),
                      hint: 'Company Name'.tr(),
                      controller: companyController),
                  SizedBox(height: size.height * 0.02),
                  detRow(
                      size: size,
                      title: 'Address'.tr(),
                      hint: 'Address'.tr(),
                      controller: addressController),
                  SizedBox(height: size.height * 0.02),
                  detRow(
                      size: size,
                      title: 'Sub Address'.tr(),
                      hint: 'Sub Address'.tr(),
                      controller: subAddressController),
                  SizedBox(height: size.height * 0.02),
                  detRow(
                      size: size,
                      title: 'City'.tr(),
                      hint: 'City'.tr(),
                      controller: cityController),
                  SizedBox(height: size.height * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        child: Text(
                          'Zone'.tr(),
                          style: MyTheme.lightTheme.textTheme.subtitle1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      SizedBox(
                        height: size.height * 0.05,
                        child: TextFormField(
                          controller: zoneController,
                          readOnly: true,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 2.0),
                              suffixIcon: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) {
                                        return Material(
                                          type: MaterialType.transparency,
                                          child: CupertinoAlertDialog(
                                            title: Text(
                                              'Zone'.tr(),
                                              style: MyTheme.lightTheme
                                                  .textTheme.subtitle1!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            content: Container(
                                              height: size.height * 0.45,
                                              child: FutureBuilder<
                                                  List<ZoneModel>>(
                                                future: ZoneAPI().getAllZones(
                                                    countryID: '63'),
                                                builder: (context, snapShot) {
                                                  if (snapShot.hasData) {
                                                    return ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: snapShot
                                                            .data!.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return ListTile(
                                                            leading: const Icon(
                                                              Icons
                                                                  .location_on_sharp,
                                                              color: customBlue,
                                                            ),
                                                            title: Text(
                                                              snapShot
                                                                  .data![index]
                                                                  .name!,
                                                              style: MyTheme
                                                                  .lightTheme
                                                                  .textTheme
                                                                  .subtitle1!
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                            ),
                                                            onTap: () {
                                                              setState(() {
                                                                zoneID = snapShot
                                                                    .data![
                                                                        index]
                                                                    .zoneId!;
                                                                zoneName =
                                                                    snapShot
                                                                        .data![
                                                                            index]
                                                                        .name!;
                                                                zoneCode =
                                                                    snapShot
                                                                        .data![
                                                                            index]
                                                                        .code!;
                                                                CachHelper.saveData(
                                                                    key:
                                                                        'P_zoneID',
                                                                    value:
                                                                        zoneID);
                                                                CachHelper.saveData(
                                                                    key:
                                                                        'P_zoneName',
                                                                    value:
                                                                        zoneName);
                                                                CachHelper.saveData(
                                                                    key:
                                                                        'P_zoneCode',
                                                                    value:
                                                                        zoneCode);
                                                              });
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          );
                                                        });
                                                  } else {
                                                    return loading();
                                                  }
                                                },
                                              ),
                                            ),
                                            actions: [
                                              CupertinoDialogAction(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    'Cancel'.tr(),
                                                    style: MyTheme.lightTheme
                                                        .textTheme.subtitle1!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.red),
                                                  ))
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: mainColor,
                                ),
                              ),
                              hintText: '',
                              hintStyle: MyTheme.lightTheme.textTheme.subtitle1!
                                  .copyWith(color: Colors.grey),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  detRow(
                      size: size,
                      title: 'PostCode'.tr(),
                      hint: 'PostCode'.tr(),
                      controller: postalController),
                  SizedBox(height: size.height * 0.02),
                  ElevatedButton(
                      onPressed: () {
                        if (firstController.text == '' ||
                            lastController.text == '' ||
                            companyController.text == '' ||
                            addressController.text == '' ||
                            subAddressController.text == '' ||
                            cityController.text == '' ||
                            zoneController.text == '' ||
                            postalController.text == '') {
                          showBottomToast(
                            toast: toast,
                            colors: Colors.red,
                            icon: Icons.warning,
                            message: 'Please Compelete your data'.tr(),
                          );
                        } else {
                          showBottomToast(
                            toast: toast,
                            colors: Colors.green,
                            icon: Icons.check_circle,
                            message: 'Update Data Success'.tr(),
                          );
                          CachHelper.saveData(
                              key: 'P_FirstName', value: firstController.text);
                          CachHelper.saveData(
                              key: 'P_LastName', value: lastController.text);
                          CachHelper.saveData(
                              key: 'P_Company', value: companyController.text);
                          CachHelper.saveData(
                              key: 'P_address', value: addressController.text);
                          CachHelper.saveData(
                              key: 'P_subAddress',
                              value: subAddressController.text);
                          CachHelper.saveData(
                              key: 'P_city', value: cityController.text);
                          CachHelper.saveData(
                              key: 'P_zone', value: zoneController.text);
                          CachHelper.saveData(
                              key: 'P_postal', value: postalController.text);
                          firstController.clear();
                          lastController.clear();
                          companyController.clear();
                          addressController.clear();
                          subAddressController.clear();
                          cityController.clear();
                          zoneController.clear();
                          postalController.clear();
                          setState(() {});
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (_) => MainOrderScreen(
                                        discount: widget.discount,
                                        fees: widget.fees,
                                        shipping: widget.shipping,
                                        subTotal: widget.subTotal,
                                        total: widget.total,
                                      )));
                        }
                      },
                      child: Text(
                        'Submit'.tr(),
                        style: MyTheme.lightTheme.textTheme.headline3,
                      ))
                ],
              ),
            ),
          ))
        ],
      ),
    ));
  }
}
