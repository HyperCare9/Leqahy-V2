import 'package:flutter/material.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';
import '../../../Model/Product_model/product_model.dart';
import '../../Screens/PrdouctScreen/productDetailsScreen.dart';

productCard(
    {dynamic size,
    Function()? onTapCart,
    required bool isCart,
    List<ProductModel>? snapShot,
    String? companyID,
    String? companyName}) {
  return ListView.builder(
      itemCount: snapShot!.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ProductDetailsScreen(
                      isCart: isCart,
                      productID: snapShot[index].productId,
                      productName: snapShot[index].name,
                      companyID: companyID,
                      companyName: companyName,
                    )));
          },
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.04, vertical: size.height * 0.01),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: size.width * 0.25,
                  height: size.height * 0.14,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(color: Colors.grey[300]!, width: 1.5),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: snapShot[index].image != ''
                              ? NetworkImage(
                                  'https://leqahyshop.hypercare-eg.com/image/${snapShot[index].image!}')
                              : const NetworkImage(
                                  'https://leqahyshop.hypercare-eg.com/image/catalog/loqa7y/Manufacturer/Medivac.jpeg'))),
                ),
                SizedBox(width: size.width * 0.03),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(color: mainColor))),
                      child: Text(
                        snapShot[index].name!,
                        style: MyTheme.lightTheme.textTheme.subtitle1,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text('Price : ${snapShot[index].price!}',
                        style: MyTheme.lightTheme.textTheme.subtitle1),
                    SizedBox(height: size.height * 0.005),
                    Text('Point : ${snapShot[index].points!}',
                        style: MyTheme.lightTheme.textTheme.subtitle1),
                  ],
                )),
                SizedBox(width: size.width * 0.04),
                InkWell(
                  onTap: onTapCart,
                  child: Card(
                    color: whiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 25,
                          color: mainColor,
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

productGridCard(
    {dynamic size,
    Function()? onTapCart,
    List<ProductModel>? snapShot,
    required bool isCart,
    String? companyID,
    String? companyName}) {
  return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
      ),
      itemCount: snapShot!.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ProductDetailsScreen(
                      isCart: isCart,
                      productID: snapShot[index].productId,
                      productName: snapShot[index].name,
                      companyID: companyID,
                      companyName: companyName,
                    )));
          },
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.04, vertical: size.height * 0.01),
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: lightBlue.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: Colors.grey[300]!, width: 1.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: size.width * 0.25,
                  height: size.height * 0.14,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(color: Colors.grey[300]!, width: 1.5),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              'https://leqahyshop.hypercare-eg.com/image/${snapShot[index].image!}'))),
                ),
                SizedBox(width: size.height * 0.03),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: mainColor))),
                  child: Text(
                    snapShot[index].name!,
                    style: MyTheme.lightTheme.textTheme.subtitle1,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Text('Price : ${snapShot[index].price!}',
                    style: MyTheme.lightTheme.textTheme.subtitle1),
                SizedBox(height: size.height * 0.005),
                Text('Point : ${snapShot[index].points!}',
                    style: MyTheme.lightTheme.textTheme.subtitle1),
                SizedBox(width: size.height * 0.04),
                InkWell(
                  onTap: onTapCart,
                  child: Card(
                    color: whiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 25,
                          color: mainColor,
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
