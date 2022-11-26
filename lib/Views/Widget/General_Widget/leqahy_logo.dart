import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

leqahyLogo({required BuildContext context, Color? logoColor}) {
  var size = MediaQuery.of(context).size;
  return SvgPicture.asset(
    'assets/images/logo.svg',
    color: logoColor,
    semanticsLabel: 'Leqahy Logo',
    height: size.height * 0.08,
    width: size.width * 0.20,
  );
}

customLeqahyLogo({Color? logoColor}) {
  return Image.asset(
    'assets/images/logo.png',
    color: logoColor,
    height: 25,
    width: 25,
  );
}
