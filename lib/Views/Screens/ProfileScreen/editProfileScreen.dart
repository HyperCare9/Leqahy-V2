// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leqahy_v2/Constant/string.dart';
import 'package:leqahy_v2/Model/Customer_model/groupCustomer_model.dart';
import 'package:leqahy_v2/Model/Customer_model/updateCustomer_model.dart';
import 'package:leqahy_v2/Services/Customer_Services/customer_services.dart';
import 'package:leqahy_v2/Views/Screens/ProfileScreen/profileScreen.dart';

import 'package:leqahy_v2/Views/Widget/Customer_Widget/cusRow.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';
import '../../../Model/Zone_model/zone_model.dart';
import '../../../Services/Zone_services/zone_services.dart';
import '../../Widget/General_Widget/buildHeader.dart';
import '../../Widget/General_Widget/buildToast.dart';
import '../../Widget/General_Widget/loading.dart';

class EditProfileScreen extends StatefulWidget {
  String? firstName;
  String? lastName;
  String? email;
  String? address;
  String? phone;
  String? status;
  String? zone;
  String? city;
  String? postal;
  EditProfileScreen(
      {Key? key,
      this.firstName,
      this.lastName,
      this.email,
      this.address,
      this.phone,
      this.status,
      this.zone,
      this.city,
      this.postal})
      : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController zoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalController = TextEditingController();
  FToast toast = FToast();
  String? zoneID;
  String? statusID;
  UpdateCustomerModel? updateCustomerModel;

  @override
  void initState() {
    super.initState();
    toast.init(context);
    firstController = TextEditingController(text: widget.firstName);
    lastController = TextEditingController(text: widget.lastName);
    emailController = TextEditingController(text: widget.email);
    addressController = TextEditingController(text: widget.address);
    phoneController = TextEditingController(text: widget.phone);
    statusController = TextEditingController(text: widget.status);
    zoneController = TextEditingController(text: widget.zone);
    cityController = TextEditingController(text: widget.city);
    postalController = TextEditingController(text: widget.postal);
  }

  @override
  Widget build(BuildContext context) {
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
              sufIcon: Icons.edit,
              preIcon: Icons.arrow_back_ios,
              preFun: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const ProfileScreen()));
              },
              sufFun: () {}),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.height * 0.01),
              child: Column(
                children: [
                  cusEditRow(
                    size: size,
                    controller: firstController,
                    title: 'First Name'.tr(),
                    hint: 'Enter your first name',
                    isSuffix: false,
                  ),
                  cusEditRow(
                    size: size,
                    controller: lastController,
                    title: 'Last Name'.tr(),
                    hint: 'Enter your Last name',
                    isSuffix: false,
                  ),
                  cusEditRow(
                    size: size,
                    controller: emailController,
                    title: 'Email'.tr(),
                    hint: 'Enter your Email',
                    isSuffix: false,
                  ),
                  cusEditRow(
                    size: size,
                    controller: addressController,
                    title: 'Address'.tr(),
                    hint: 'Enter your Address',
                    isSuffix: false,
                  ),
                  cusEditRow(
                    size: size,
                    controller: phoneController,
                    title: 'Phone'.tr(),
                    hint: 'Enter your Phone',
                    isSuffix: false,
                  ),
                  cusEditRow(
                    size: size,
                    controller: passwordController,
                    title: 'Password'.tr(),
                    hint: 'Enter your Password',
                    isSuffix: false,
                  ),
                  cusEditRow(
                    size: size,
                    controller: cityController,
                    title: 'City'.tr(),
                    hint: 'Enter your city',
                    isSuffix: false,
                  ),
                  cusEditRow(
                    size: size,
                    controller: postalController,
                    title: 'PostCode'.tr(),
                    hint: 'Enter your postal code',
                    isSuffix: false,
                  ),
                  cusEditRow(
                      size: size,
                      controller: statusController,
                      title: 'Status'.tr(),
                      hint: 'Enter your status',
                      isSuffix: true,
                      onSuffixTap: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return Material(
                                type: MaterialType.transparency,
                                child: CupertinoAlertDialog(
                                  title: Text(
                                    'Status'.tr(),
                                    style: MyTheme
                                        .lightTheme.textTheme.subtitle1!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  content: Container(
                                    height: size.height * 0.45,
                                    child:
                                        FutureBuilder<List<GroupCustomerModel>>(
                                      future: CustomerAPI().getGroupCustomer(
                                          languageID: context.locale ==
                                                  const Locale('en', 'US')
                                              ? '1'
                                              : '2'),
                                      builder: (context, snapShot) {
                                        if (snapShot.hasData) {
                                          return ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: snapShot.data!.length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  leading: const Icon(
                                                    Icons.person,
                                                    color: customBlue,
                                                  ),
                                                  title: Text(
                                                    snapShot.data![index].name!,
                                                    style: MyTheme.lightTheme
                                                        .textTheme.subtitle1!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      statusID = snapShot
                                                          .data![index]
                                                          .customerGroupId!;
                                                      zoneController.text =
                                                          snapShot.data![index]
                                                              .name!;
                                                    });
                                                    Navigator.of(context).pop();
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
                                          style: MyTheme
                                              .lightTheme.textTheme.subtitle1!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red),
                                        ))
                                  ],
                                ),
                              );
                            });
                      }),
                  cusEditRow(
                      size: size,
                      controller: zoneController,
                      title: 'Zone'.tr(),
                      hint: 'Enter your Zone',
                      isSuffix: true,
                      onSuffixTap: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return Material(
                                type: MaterialType.transparency,
                                child: CupertinoAlertDialog(
                                  title: Text(
                                    'Zone'.tr(),
                                    style: MyTheme
                                        .lightTheme.textTheme.subtitle1!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  content: Container(
                                    height: size.height * 0.45,
                                    child: FutureBuilder<List<ZoneModel>>(
                                      future: ZoneAPI()
                                          .getAllZones(countryID: '63'),
                                      builder: (context, snapShot) {
                                        if (snapShot.hasData) {
                                          return ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: snapShot.data!.length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  leading: const Icon(
                                                    Icons.location_on_sharp,
                                                    color: customBlue,
                                                  ),
                                                  title: Text(
                                                    snapShot.data![index].name!,
                                                    style: MyTheme.lightTheme
                                                        .textTheme.subtitle1!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      zoneID = snapShot
                                                          .data![index].zoneId!;
                                                      zoneController.text =
                                                          snapShot.data![index]
                                                              .name!;
                                                    });
                                                    Navigator.of(context).pop();
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
                                          'Cancel',
                                          style: MyTheme
                                              .lightTheme.textTheme.subtitle1!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red),
                                        ))
                                  ],
                                ),
                              );
                            });
                      }),
                  SizedBox(height: size.height * 0.01),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        if (firstController.text == '' ||
                            lastController.text == '' ||
                            emailController.text == '' ||
                            addressController.text == '' ||
                            phoneController.text == '' ||
                            statusController.text == '' ||
                            zoneController.text == '' ||
                            cityController.text == '' ||
                            postalController.text == '') {
                          showBottomToast(
                            toast: toast,
                            colors: Colors.red,
                            icon: Icons.warning,
                            message: 'Please Compelete your data'.tr(),
                          );
                        } else {
                          updateCustomerModel = await CustomerAPI()
                              .updateCustomer(
                                  firstName: firstController.text,
                                  lastName: lastController.text,
                                  phone: phoneController.text,
                                  address: addressController.text,
                                  city: cityController.text,
                                  countryID: '63',
                                  customerID: CustomerData().cusID.toString(),
                                  email: emailController.text,
                                  groupID: statusID,
                                  password: passwordController.text,
                                  postal: postalController.text,
                                  zoneID: zoneID);
                          if (updateCustomerModel!.status == true) {
                            showBottomToast(
                              toast: toast,
                              colors: Colors.green,
                              icon: Icons.check,
                              message: 'Update Profile Data Success'.tr(),
                            );
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => const ProfileScreen()));
                          } else {
                            showBottomToast(
                              toast: toast,
                              colors: Colors.red,
                              icon: Icons.warning,
                              message: 'Update Profile Data Failed'.tr(),
                            );
                          }
                        }
                      },
                      child: Card(
                        color: mainColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02,
                              vertical: size.height * 0.005),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Update'.tr(),
                                style: MyTheme.lightTheme.textTheme.subtitle1!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: whiteColor),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              const Icon(
                                Icons.upload,
                                color: whiteColor,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                ],
              ),
            ),
          ))
        ],
      ),
    ));
  }
}
