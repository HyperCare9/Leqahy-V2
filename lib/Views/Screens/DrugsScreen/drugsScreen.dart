// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:leqahy_v2/Views/Widget/General_Widget/loading.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';
import '../../../Model/Product_model/product_company_model.dart';
import '../../../Services/Prdouct_Services/productAPI.dart';
import '../../Widget/General_Widget/buildHeader.dart';
import '../../Widget/productWidget/companyCards.dart';
import '../PrdouctScreen/productsScreen.dart';

class DrugsScreen extends StatefulWidget {
  String? classID;
  static const String routeName = '/DrugsScreen';
  DrugsScreen({
    Key? key,
    this.classID,
  }) : super(key: key);

  @override
  State<DrugsScreen> createState() => _DrugsScreenState();
}

class _DrugsScreenState extends State<DrugsScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildcustomHeader(
              context: context,
              size: size,
              preColor: mainColor,
              sufColor: Colors.transparent,
              sufIcon: Icons.arrow_back_ios,
              preIcon: Icons.arrow_back_ios,
              preFun: () {
                Navigator.of(context).pop();
              },
              sufFun: () {}),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.11),
            child: SizedBox(
              height: size.height * 0.06,
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 2.0),
                    hintText: 'Leqahy app search',
                    hintStyle: MyTheme.lightTheme.textTheme.subtitle1!
                        .copyWith(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: mainColor,
                      size: 25,
                    ),
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
          ),
          SizedBox(height: size.height * 0.02),
          Center(
            child: Image.asset(
              'assets/images/drug.png',
              height: size.height * 0.25,
              width: size.width * 0.85,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: mainColor, width: 2.0)),
            ),
            child: Text(
              'Drugs',
              style: MyTheme.lightTheme.textTheme.headline2!
                  .copyWith(color: mainColor),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Expanded(
            child: FutureBuilder<List<ProductCompanyModel>>(
                future: ProductAPI().getAllCompanies(classID: widget.classID),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    return GridView.builder(
                        shrinkWrap: true,
                        // scrollDirection: Axis.horizontal,
                        itemCount: snapShot.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 1.0,
                          mainAxisSpacing: 1.0,
                        ),
                        itemBuilder: (context, index) {
                          print(snapShot.data![index].image);
                          return companyCard(
                            size: size,
                            backgroundImage: snapShot.data![index].image != ''
                                ? NetworkImage(
                                    'https://leqahyapp.hypercare-eg.com/media/${snapShot.data![index].image}')
                                : const NetworkImage(
                                    'https://leqahyapp.hypercare-eg.com/media/image/notfound/no-company.png'),
                            text: snapShot.data![index].name,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => ProductsScreen(
                                        companyID: snapShot
                                            .data![index].manufacturerId
                                            .toString(),
                                        companyName: snapShot.data![index].name,
                                      )));
                            },
                          );
                        });
                  } else {
                    return loading();
                  }
                }),
          )
        ],
      ),
    ));
  }
}
