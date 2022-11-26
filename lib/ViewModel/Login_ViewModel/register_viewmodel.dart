import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Constant/colors.dart';
import '../../Constant/theme.dart';
import '../../Views/Screens/LoginScreen/loginScreen.dart';
import '../../Views/Widget/General_Widget/buildHeader.dart';

class RegisterViewMode {
  bool isVisiable = false;
  String nameHint = 'Full Name';
  String emailHint = 'Email';
  String phoneHint = 'Phone';
  String passwordHint = 'Password';
  IconData visiableIcon = Icons.visibility;
  IconData unVisiableIcon = Icons.visibility_off;

  regAppBar({required BuildContext context, dynamic size}) {
    return buildcustomHeader(
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
        sufFun: () {});
  }

  regHeader({dynamic size}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Register'.tr(),
          style: MyTheme.lightTheme.textTheme.headline1!
              .copyWith(color: Colors.grey[700], fontSize: 35.0),
        ),
        SizedBox(width: size.width * 0.02),
        Image.asset('assets/images/reg1.png')
      ],
    );
  }

  orWidget() {
    return Center(
      child: Text(
        'OR'.tr(),
        style: MyTheme.lightTheme.textTheme.bodyText1!
            .copyWith(color: Colors.grey),
      ),
    );
  }

  socialWidget({dynamic size}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const FaIcon(
          FontAwesomeIcons.facebook,
          color: mainColor,
          size: 45,
        ),
        SizedBox(width: size.width * 0.03),
        const FaIcon(
          FontAwesomeIcons.googlePlus,
          color: Colors.red,
          size: 45,
        ),
      ],
    );
  }

  regWidget(
      {dynamic size, Function()? onRegTap, required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.03),
          child: Image.asset('assets/images/reg3.png'),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: context.locale == const Locale('en', 'US')
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0))
                        : const BorderRadius.only(
                            topRight: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0)))),
            onPressed: onRegTap,
            child: Text(
              'Register'.tr(),
              style: MyTheme.lightTheme.textTheme.headline3,
            ))
      ],
    );
  }

  checkServices({dynamic size, bool? value, Function(bool?)? onChanged}) {
    return CheckboxListTile(
      value: value,
      controlAffinity: ListTileControlAffinity.leading,
      side: BorderSide(color: Colors.grey[700]!),
      title: Padding(
        padding: EdgeInsets.only(top: size.height * 0.025),
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: 'Be registering here asymmetric ,'.tr(),
              style: MyTheme.lightTheme.textTheme.subtitle1!
                  .copyWith(color: Colors.grey)),
          const TextSpan(text: ' '),
          TextSpan(
              text: 'you agree the terms of services and policy'.tr(),
              style: MyTheme.lightTheme.textTheme.subtitle1)
        ])),
      ),
      onChanged: onChanged,
    );
  }
}
