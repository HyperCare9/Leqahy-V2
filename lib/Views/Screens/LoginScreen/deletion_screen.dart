import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leqahy_v2/Constant/string.dart';
import 'package:leqahy_v2/Constant/theme.dart';
import 'package:leqahy_v2/Model/login_model/delete_user_model.dart';
import 'package:leqahy_v2/Services/Login_Services/login_services.dart';
import 'package:leqahy_v2/Views/Screens/BoardingScreen/boardingScreen.dart';
import 'package:leqahy_v2/Views/Screens/LoginScreen/loginScreen.dart';

import '../../../Constant/cachHelper.dart';
import '../../../Constant/colors.dart';
import '../../../Constant/initial_route.dart';
import '../../Widget/General_Widget/buildHeader.dart';
import '../../Widget/General_Widget/buildToast.dart';
import '../../Widget/Login_Widget/delete_text.dart';

class DeletionScreen extends StatefulWidget {
  static String routeName = InitailRoute()
      .route(routeEN: 'Delete Account', routeAR: 'حذف الحساب الشخصى');
  const DeletionScreen({super.key});

  @override
  State<DeletionScreen> createState() => _DeletionScreenState();
}

class _DeletionScreenState extends State<DeletionScreen> {
  FToast toast = FToast();
  TextEditingController passWordController = TextEditingController();
  bool isVisiable = false;
  DeleteUserModel? deleteUserModel;
  @override
  void initState() {
    super.initState();
    toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildcustomHeader(
                context: context,
                size: size,
                preColor: mainColor,
                sufColor: Colors.transparent,
                sufIcon: Icons.delete,
                preIcon: Icons.arrow_back_ios,
                preFun: () {
                  Navigator.of(context).pop();
                },
                sufFun: () {}),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    tileColor: Colors.red,
                    leading: const Icon(
                      Icons.warning,
                      color: Colors.white,
                      size: 30,
                    ),
                    title: Text(
                      'Are you Sure?'.tr(),
                      style: MyTheme.lightTheme.textTheme.headline2!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Are you sure you want to delete your account ? \n Once your account is deleted , all of its resources and data wll be permanently deleted . Please enter your password to confirm you would like to permanently delete your acount .'
                        .tr(),
                    style: MyTheme.lightTheme.textTheme.subtitle1!
                        .copyWith(fontWeight: FontWeight.bold),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  SizedBox(height: size.height * 0.04),
                  Text(
                    'Confirm your Password to delete'.tr(),
                    style: MyTheme.lightTheme.textTheme.headline4!.copyWith(
                        color: Colors.red, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: size.height * 0.01),
                  DeleteText(
                    passwordController: passWordController,
                    isVisiable: isVisiable,
                    onTap: () {
                      setState(() {
                        isVisiable = !isVisiable;
                      });
                    },
                  ),
                  SizedBox(height: size.height * 0.06),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () async {
                          if (passWordController.text != '') {
                            deleteUserModel = await LoginAPI().deleteAccount(
                                email: CustomerData().cusEmail,
                                password: passWordController.text);
                            if (deleteUserModel!.status == true) {
                              try {
                                showBottomToast(
                                  toast: toast,
                                  colors: Colors.green,
                                  icon: Icons.check_circle_outline,
                                  message: 'Delete Account Succuess'.tr(),
                                );
                                CachHelper.clearData();
                                goToBoarding();
                              } catch (e) {
                                print(e);
                              }
                            } else {
                              showBottomToast(
                                toast: toast,
                                colors: Colors.red,
                                icon: Icons.warning,
                                message: 'Delete Account Faild'.tr(),
                              );
                            }
                          } else {
                            showBottomToast(
                              toast: toast,
                              colors: Colors.red,
                              icon: Icons.warning,
                              message: 'Please Compelte you data'.tr(),
                            );
                          }
                        },
                        child: Text(
                          'Delete my account'.tr(),
                          style: MyTheme.lightTheme.textTheme.headline3!
                              .copyWith(fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  goToBoarding() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const BoardingScreen()));
  }
}
