import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../Constant/colors.dart';
import 'loginScreen.dart';
import '../../Widget/General_Widget/buildLeqahy.dart';

import '../../../Constant/theme.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
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
                }),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: Text(
                'Create New Password'.tr(),
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
            SizedBox(height: size.height * 0.06),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.14),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: 'Password'.tr(),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.14),
              child: TextFormField(
                controller: confirmController,
                decoration: InputDecoration(
                    hintText: 'Confirm Passowrd'.tr(),
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
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const LoginScreen()));
                  },
                  child: Text(
                    'Rest Password'.tr(),
                    style: MyTheme.lightTheme.textTheme.subtitle1!
                        .copyWith(color: whiteColor),
                  )),
            ),
            SizedBox(height: size.height * 0.03),
            Center(
              child: Image.asset(
                'assets/images/lock.png',
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
