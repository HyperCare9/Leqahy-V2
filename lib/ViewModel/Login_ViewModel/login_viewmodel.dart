import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../Views/Screens/LoginScreen/registerScreen.dart';

import '../../Constant/theme.dart';

class LoginViewModel {
  bool isVisiable = false;
  String logoText = 'Leqahy';
  String appBarTitle = 'Login';
  String emailHint = 'Email'.tr();
  String passwordHint = 'Password'.tr();
  IconData visiableIcon = Icons.visibility;
  IconData unVisiableIcon = Icons.visibility_off;
  String buttonText = 'Login';
  String forgetText = 'Forget Password ?';
  String createText = 'Create new account';
  String registerText = 'register now';

  Widget register({required BuildContext context}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(RegisterScreen.routeName);
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: createText,
              style: MyTheme.lightTheme.textTheme.subtitle1!
                  .copyWith(color: Colors.grey)),
          const TextSpan(text: '  '),
          TextSpan(
              text: registerText,
              style: MyTheme.lightTheme.textTheme.subtitle1),
        ]),
      ),
    );
  }
}
