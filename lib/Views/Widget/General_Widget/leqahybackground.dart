import 'package:flutter/material.dart';

Widget leqahyBackGround({Widget? child}) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: const BoxDecoration(
        image: DecorationImage(
            opacity: 0.7,
            fit: BoxFit.fitWidth,
            image: AssetImage(
              'assets/images/backLogo.png',
            ))),
    child: Stack(
      children: [
        // Center(
        //     child: SvgPicture.asset(
        //   'assets/images/logo.svg',
        //   width: double.infinity,
        //   height: double.infinity,

        //   // fit: BoxFit.fitWidth,
        // )),
        child!,
      ],
    ),
  );
}
