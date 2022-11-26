import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../Constant/theme.dart';
import 'newPassowrdScreen.dart';
import '../../Widget/General_Widget/buildLeqahy.dart';

import '../../../Constant/colors.dart';

class SendMailScreen extends StatefulWidget {
  const SendMailScreen({Key? key}) : super(key: key);

  @override
  State<SendMailScreen> createState() => _SendMailScreenState();
}

class _SendMailScreenState extends State<SendMailScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          buildLeqahy(
              size: size,
              onTap: () {
                Navigator.of(context).pop();
              }),
          SizedBox(height: size.height * 0.03),
          Image.asset(
            'assets/images/mailImg.png',
            width: size.width * 0.85,
            height: size.height * 0.20,
          ),
          SizedBox(height: size.height * 0.03),
          Text(
            'Check your Mail'.tr(),
            style: MyTheme.lightTheme.textTheme.bodyText1!
                .copyWith(color: Colors.black54),
          ),
          SizedBox(height: size.height * 0.03),
          Text(
            'We have sent a password recover \nInstructions to your email.'
                .tr(),
            textAlign: TextAlign.center,
            style: MyTheme.lightTheme.textTheme.subtitle1!
                .copyWith(color: Colors.black54),
          ),
          SizedBox(height: size.height * 0.06),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const SendMailScreen()));
                },
                child: Text(
                  'Open email app'.tr(),
                  style: MyTheme.lightTheme.textTheme.subtitle1!
                      .copyWith(color: whiteColor),
                )),
          ),
          SizedBox(height: size.height * 0.015),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const NewPasswordScreen()));
            },
            child: Text(
              "Skip,i'll confirm later".tr(),
              style: MyTheme.lightTheme.textTheme.subtitle1!
                  .copyWith(color: mainColor),
            ),
          )
        ],
      ),
    ));
  }
}
