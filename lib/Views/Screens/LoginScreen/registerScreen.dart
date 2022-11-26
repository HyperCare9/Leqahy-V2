import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Constant/string.dart';
import '../../../Constant/validator.dart';
import '../../../Model/login_model/register_model.dart';
import '../../../Services/IP.dart';
import '../../../Services/Login_Services/login_services.dart';
import '../../../ViewModel/Login_ViewModel/register_viewmodel.dart';
import 'loginScreen.dart';
import '../../Widget/General_Widget/buildToast.dart';
import '../../Widget/Login_Widget/registerField.dart';
import '../../../Constant/colors.dart';
import '../../Widget/General_Widget/buildHeader.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/RegisterScreen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool value = false;
  RegisterViewMode registerVM = RegisterViewMode();
  double lat = 0.0;
  double long = 0.0;
  String address = '';
  RegisterModel? registerModel;
  FToast toast = FToast();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    toast.init(context);
    IpInfoAPI.getIPADdress();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    addressController = TextEditingController(
        text: AddressData().address ??=
            '1600 Amphitheatre Pkwy,Mountain View,United States');
    return SafeArea(
        child: Form(
      key: formKey,
      child: Scaffold(
          body: Column(children: [
        buildcustomHeader(
            context: context,
            size: size,
            preColor: mainColor,
            sufColor: Colors.transparent,
            sufIcon: Icons.arrow_back_ios,
            preIcon: Icons.arrow_back_ios,
            preFun: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginScreen()));
            },
            sufFun: () {}),
        registerVM.regHeader(size: size),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.10,
                    vertical: size.height * 0.02),
                padding: EdgeInsets.only(top: size.height * 0.02),
                decoration: BoxDecoration(
                    border: Border.all(color: darkGrey),
                    borderRadius: BorderRadius.circular(20.0),
                    color: darkGrey,
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [whiteColor, whiteColor, darkGrey])),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    registerField(
                        size: size,
                        hint: 'First Name'.tr(),
                        obscure: false,
                        controller: firstController,
                        validator: (val) =>
                            Validator().validateEmpty(value: val!)),
                    registerField(
                        size: size,
                        hint: 'Last Name'.tr(),
                        obscure: false,
                        controller: lastController,
                        validator: (val) =>
                            Validator().validateEmpty(value: val!)),
                    registerField(
                        size: size,
                        hint: 'Email'.tr(),
                        obscure: false,
                        controller: emailController,
                        validator: (val) =>
                            Validator().validateEmail(value: val!)),
                    registerField(
                        size: size,
                        hint: 'Phone'.tr(),
                        obscure: false,
                        controller: phoneController,
                        validator: (val) =>
                            Validator().validatePhone(value: val!)),
                    registerField(
                        size: size,
                        hint: 'Password'.tr(),
                        controller: passwordController,
                        obscure: true,
                        validator: (val) =>
                            Validator().validatePassword(value: val!)),
                    registerField(
                        size: size,
                        hint: 'Confirm Password'.tr(),
                        obscure: true,
                        controller: confirmPasswordController,
                        validator: (val) => Validator().validatePasswordConfirm(
                            confirm: val!, pass: passwordController.text)),
                    registerField(
                        size: size,
                        hint: 'Address',
                        obscure: false,
                        controller: addressController,
                        validator: (val) =>
                            Validator().validateEmpty(value: val!)),
                    registerVM.checkServices(
                        size: size,
                        value: value,
                        onChanged: (val) {
                          setState(() {
                            value = val!;
                          });
                        }),
                    SizedBox(height: size.height * 0.01),
                    registerVM.regWidget(
                        context: context,
                        size: size,
                        onRegTap: () async {
                          var isValidate = formKey.currentState!.validate();
                          if (isValidate) {
                            if (value == false) {
                              showBottomToast(
                                  toast: toast,
                                  colors: Colors.red,
                                  icon: Icons.warning,
                                  message: 'you must accept our policy'.tr());
                            } else {
                              registerModel = await LoginAPI().userRegister(
                                  firstName: firstController.text,
                                  lastName: lastController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  password: confirmPasswordController.text,
                                  address: addressController.text);
                              if (registerModel!.status == true) {
                                showBottomToast(
                                    toast: toast,
                                    colors: Colors.green,
                                    icon: Icons.check,
                                    message: 'Register Success'.tr());
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (_) => const LoginScreen()));
                              } else {
                                showBottomToast(
                                    toast: toast,
                                    colors: Colors.red,
                                    icon: Icons.warning,
                                    message: 'Register Failed'.tr());
                              }
                            }
                          }
                        }),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.01),
              // registerVM.orWidget(),
              // SizedBox(height: size.height * 0.01),
              // registerVM.socialWidget(size: size),
              // SizedBox(height: size.height * 0.01),
            ],
          ),
        ))
      ])),
    ));
  }
}
