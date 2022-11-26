import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leqahy_v2/Views/Screens/AboutScreen/pravicy.dart';
import '../../../Constant/initial_route.dart';
import '../../../Constant/theme.dart';
import '../../../Model/login_model/login_model.dart';
import '../../../Services/Login_Services/login_services.dart';
import '../../../ViewModel/Login_ViewModel/login_viewmodel.dart';
import '../HomeScreen/mainScreen.dart';
import 'registerScreen.dart';
import '../../Widget/General_Widget/buildToast.dart';
import '../../../Constant/colors.dart';
import '../../Widget/General_Widget/buildHeader.dart';

class LoginScreen extends StatefulWidget {
  static String routeName =
      InitailRoute().route(routeEN: 'Logout', routeAR: 'تسجيل الخروج');
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel loginVM = LoginViewModel();
  FToast toast = FToast();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginModel? loginModel;
  double lat = 0.0;
  double long = 0.0;
  String address = '';

  @override
  void initState() {
    super.initState();
    toast.init(context);
    Future.delayed(Duration.zero, () {
      openDialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildcustomHeader(
                    size: size,
                    context: context,
                    preColor: Colors.transparent,
                    sufColor: Colors.transparent,
                    sufIcon: Icons.delete_sweep_outlined,
                    preIcon: Icons.arrow_back_ios,
                  ),
                  Text(
                    'Welcome..!'.tr(),
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.10),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: loginVM.emailHint,
                          hintStyle: MyTheme.lightTheme.textTheme.subtitle1!
                              .copyWith(color: Colors.grey),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: mainColor,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.10),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: loginVM.isVisiable == false ? true : false,
                      decoration: InputDecoration(
                          hintText: loginVM.passwordHint,
                          hintStyle: MyTheme.lightTheme.textTheme.subtitle1!
                              .copyWith(color: Colors.grey),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  loginVM.isVisiable = !loginVM.isVisiable;
                                });
                              },
                              icon: loginVM.isVisiable == false
                                  ? Icon(
                                      loginVM.unVisiableIcon,
                                      size: 20,
                                      color: Colors.grey[400],
                                    )
                                  : Icon(
                                      loginVM.visiableIcon,
                                      size: 20,
                                      color: Colors.grey,
                                    )),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: mainColor,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          )),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          side: const BorderSide(color: mainColor)),
                      onPressed: () async {
                        if (emailController.text != '' &&
                            passwordController.text != '') {
                          loginModel = await LoginAPI().userLogin(
                              email: emailController.text,
                              password: passwordController.text);

                          if (loginModel!.status == true) {
                            showBottomToast(
                              toast: toast,
                              colors: Colors.green,
                              icon: Icons.check_circle_outline,
                              message: 'Login Succuess'.tr(),
                            );
                            goToHome();
                          } else {
                            showBottomToast(
                              toast: toast,
                              colors: Colors.red,
                              icon: Icons.warning,
                              message: 'Login Faild'.tr(),
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
                        'Login'.tr(),
                        style: MyTheme.lightTheme.textTheme.subtitle1!
                            .copyWith(color: whiteColor),
                      )),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (_) => const RestPasswordScren()));
                  //   },
                  //   child: Text(
                  //     'Forget Password?'.tr(),
                  //     style: MyTheme.lightTheme.textTheme.subtitle1,
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const RegisterScreen()));
                    },
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Create new account'.tr(),
                          style: MyTheme.lightTheme.textTheme.subtitle1!
                              .copyWith(color: Colors.grey)),
                      const TextSpan(text: ' '),
                      TextSpan(
                          text: 'Regiter now'.tr(),
                          style: MyTheme.lightTheme.textTheme.bodyText2)
                    ])),
                  ),
                  Image.asset(
                    'assets/images/loginImg.png',
                    width: size.width * 0.75,
                    height: size.height * 0.31,
                    // fit: BoxFit.fill,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //         builder: (_) => const RegisterScreen()));
                  //   },
                  //   child: RichText(
                  //       text: TextSpan(children: [
                  //     TextSpan(
                  //         text: 'Create new account'.tr(),
                  //         style: MyTheme.lightTheme.textTheme.subtitle1!
                  //             .copyWith(color: Colors.grey)),
                  //     const TextSpan(text: ' '),
                  //     TextSpan(
                  //         text: 'Regiter now'.tr(),
                  //         style: MyTheme.lightTheme.textTheme.bodyText2)
                  //   ])),
                  // ),
                  InkWell(
                    onTap: () {
                      privacyPolicy(context);
                    },
                    child: Text(
                      'Privacy Policy'.tr(),
                      style: MyTheme.lightTheme.textTheme.subtitle2,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Version 1.1.1 Build 20220909',
                        style: MyTheme.lightTheme.textTheme.subtitle2!.copyWith(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      Text(
                        'حقوق الملكية محفوظة لشركة لقاحى 2022',
                        style: MyTheme.lightTheme.textTheme.subtitle2!.copyWith(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                ],
              ))),
    );
  }

  goToHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const MainScreen()));
  }

  openDialog() {
    privacyPolicy(context);
  }
}
