import 'package:flutter/material.dart';
import '../../../Constant/colors.dart';

import '../../../Constant/theme.dart';

doctorCard(
    {dynamic size,
    String? img,
    String? name,
    String? price,
    Function()? bookDoctor}) {
  return Center(
    child: Container(
      margin: EdgeInsets.only(bottom: size.height * 0.015),
      height: size.height * 0.20,
      width: size.width * 0.95,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [whiteColor, whiteColor, Color(0xFFA5DEF9)])),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.45,
              child: Stack(
                children: [
                  Center(
                    child: Image.asset('assets/images/backLogo.png',
                        height: size.height * 0.25, width: size.width * 0.55),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Center(
                        child: CircleAvatar(
                      maxRadius: 50,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(img!),
                    )),
                  )
                ],
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'د/ $name',
                  style: MyTheme.lightTheme.textTheme.bodyText1!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: size.width * 0.40,
                  child: const Divider(
                    color: mainColor,
                    thickness: 1.5,
                  ),
                ),
                Text(
                  'الكشف $price جنيه',
                  style: MyTheme.lightTheme.textTheme.subtitle1,
                ),
                InkWell(
                  onTap: bookDoctor,
                  child: Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    height: 30,
                    width: size.width * 0.30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [mainColor, mainColor])),
                    child: Center(
                      child: Text(
                        'احجز الان',
                        style: MyTheme.lightTheme.textTheme.headline4,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    ),
  );
}

bookDoctorCard({
  dynamic size,
  String? img,
  String? name,
  String? special,
}) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Row(
      children: [
        SizedBox(
          width: size.width * 0.45,
          child: Stack(
            children: [
              Center(
                child: Image.asset('assets/images/backLogo.png',
                    color: mainColor,
                    height: size.height * 0.25,
                    width: size.width * 0.55),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Center(
                    child: CircleAvatar(
                  maxRadius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(img!),
                )),
              )
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'د/ $name',
              style: MyTheme.lightTheme.textTheme.bodyText1!
                  .copyWith(fontWeight: FontWeight.bold, color: mainColor),
            ),
            SizedBox(
              width: size.width * 0.40,
              child: const Divider(
                color: mainColor,
                thickness: 1.5,
              ),
            ),
            Text(
              special!,
              style: MyTheme.lightTheme.textTheme.subtitle1!
                  .copyWith(color: mainColor),
            ),
          ],
        )
      ],
    ),
  );
}
