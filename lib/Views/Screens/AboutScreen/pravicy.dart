import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leqahy_v2/Constant/colors.dart';
import 'package:leqahy_v2/Constant/theme.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import '../../../Constant/string.dart';

privacyPolicy(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Container(
                  color: mainColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.cancel,
                            color: mainColor,
                          )),
                      Text('Privacy Policy'.tr(),
                          style: MyTheme.lightTheme.textTheme.subtitle1!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: whiteColor)),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.cancel,
                            color: whiteColor,
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: WebViewPlus(
                    javascriptChannels: null,
                    initialUrl: LanguageData().language == 1
                        ? 'assets/privacy.html'
                        : 'assets/privacy_ar.html',
                    javascriptMode: JavascriptMode.unrestricted,
                  ),
                )
              ],
            ),
          ),
        );
      });
}
