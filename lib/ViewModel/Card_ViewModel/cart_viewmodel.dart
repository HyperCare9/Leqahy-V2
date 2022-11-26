import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../Constant/colors.dart';
import '../../Constant/theme.dart';

class CartViewModel {
  productCard(
      {dynamic size,
      String? productImage,
      String? productName,
      String? productPrice,
      String? quantity,
      required Function() onTap,
      Function()? removeTap,
      Function()? plusTap,
      Function()? minTap,
      Widget? quantityWidget}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
            top: size.height * 0.005,
            bottom: size.height * 0.005,
            right: size.width * 0.03,
            left: size.width * 0.03),
        padding: EdgeInsets.only(top: size.height * 0.01),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: darkGrey, width: 2.0),
            gradient: const LinearGradient(
                colors: [whiteColor, whiteColor, darkGrey, darkGrey, darkGrey],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: size.width * 0.03, left: size.width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.45,
                        child: Text(
                          productName!,
                          style: MyTheme.lightTheme.textTheme.bodyText2!
                              .copyWith(fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      RichText(
                          text: TextSpan(
                              style: MyTheme.lightTheme.textTheme.subtitle1,
                              children: [
                            TextSpan(text: 'Price :'.tr()),
                            TextSpan(text: productPrice)
                          ])),
                      SizedBox(height: size.height * 0.005),
                    ],
                  ),
                  Center(
                      child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    maxRadius: 40,
                    backgroundImage:
                        const AssetImage('assets/images/logoMark.png'),
                    child: CircleAvatar(
                      maxRadius: 27,
                      backgroundColor: whiteColor,
                      backgroundImage: productImage !=
                              'https://leqahyapp.hypercare-eg.com/media/'
                          ? NetworkImage(productImage!)
                          : const NetworkImage(
                              'https://leqahyshop.hypercare-eg.com/image/catalog/loqa7y/Manufacturer/Medivac.jpeg'),
                    ),
                  )),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[500]!,
              thickness: 1.5,
              indent: size.width * 0.03,
              endIndent: size.width * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: size.width * 0.01, left: size.width * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: removeTap,
                    child: Card(
                        color: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.delete_outline,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                Text(
                                  'Remove'.tr(),
                                  style: MyTheme.lightTheme.textTheme.subtitle1!
                                      .copyWith(fontWeight: FontWeight.bold),
                                )
                              ],
                            ))),
                  ),
                  quantityWidget!
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            )
          ],
        ),
      ),
    );
  }
}

// snapShot.data![index]
//                                                                 .image !=
//                                                             ''
//                                                         ? NetworkImage(
//                                                             'https://leqahyapp.hypercare-eg.com/media/${snapShot.data![index].image!}')
//                                                         : const NetworkImage(
//                                                             'https://leqahyshop.hypercare-eg.com/image/catalog/loqa7y/Manufacturer/Medivac.jpeg')
