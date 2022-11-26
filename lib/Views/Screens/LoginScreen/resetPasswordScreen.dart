import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Constant/theme.dart';
import '../../Widget/General_Widget/buildLeqahy.dart';
import '../../Widget/General_Widget/buildToast.dart';

import '../../../Constant/colors.dart';

class RestPasswordScren extends StatefulWidget {
  const RestPasswordScren({Key? key}) : super(key: key);

  @override
  State<RestPasswordScren> createState() => _RestPasswordScrenState();
}

class _RestPasswordScrenState extends State<RestPasswordScren> {
  TextEditingController emailController = TextEditingController();
  FToast toast = FToast();

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildLeqahy(
              size: size,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: Text(
                'Rest Password'.tr(),
                textAlign: TextAlign.start,
                style: MyTheme.lightTheme.textTheme.bodyText2!
                    .copyWith(color: Colors.black45),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.12),
              child: Text(
                "Enter The email associated with your account and we'll send an email with instructions to reset your password."
                    .tr(),
                textAlign: TextAlign.start,
                style: MyTheme.lightTheme.textTheme.subtitle1!
                    .copyWith(color: Colors.black45),
              ),
            ),
            SizedBox(height: size.height * 0.08),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.14),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: 'Email'.tr(),
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
            SizedBox(height: size.height * 0.02),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  onPressed: () {
                    if (emailController.text == '') {
                      showBottomToast(
                          colors: Colors.red,
                          icon: Icons.warning,
                          toast: toast,
                          message: 'Please Enter your mail'.tr());
                    }
                  },
                  child: Text(
                    'Send Instructions'.tr(),
                    style: MyTheme.lightTheme.textTheme.subtitle1!
                        .copyWith(color: whiteColor),
                  )),
            ),
            SizedBox(height: size.height * 0.04),
            Center(
              child: Image.asset(
                'assets/images/restImg.png',
                height: size.height * 0.30,
                width: size.width * 0.80,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
