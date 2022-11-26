import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../Constant/initial_route.dart';
import '../../../Constant/theme.dart';
import '../../../ViewModel/Home_ViewModel/homeViewModel.dart';
import 'editProfileScreen.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/string.dart';
import '../../../Model/Customer_model/customer_model.dart';
import '../../../Model/cards_model/card_model.dart';
import '../../../Services/Customer_Services/customer_services.dart';
import '../../Widget/General_Widget/buildHeader.dart';
import '../../Widget/General_Widget/loading.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName =
      InitailRoute().route(routeEN: 'Profile', routeAR: 'الصفحه الشخصيه');
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<CardModel> cartList = [];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  HomeViewModel homeVM = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      backgroundColor: whiteColor,
      extendBody: true,
      body: Column(
        children: [
          buildcustomHeader(
              context: context,
              size: size,
              preColor: mainColor,
              sufColor: Colors.transparent,
              sufIcon: Icons.edit,
              preIcon: Icons.arrow_back_ios,
              preFun: () {
                Navigator.of(context).pop();
              },
              sufFun: () {}),
          SizedBox(height: size.height * 0.02),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: FutureBuilder<List<CustomerModel>>(
              future: CustomerAPI()
                  .getCustomerData(customerID: CustomerData().cusID.toString()),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapShot.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                                child: CircleAvatar(
                              backgroundColor: whiteColor,
                              maxRadius: 70,
                              backgroundImage:
                                  AssetImage('assets/images/logoMark.png'),
                              child: CircleAvatar(
                                maxRadius: 47,
                                backgroundColor: whiteColor,
                                child: Icon(
                                  Icons.person,
                                  size: 80,
                                  color: mainColor,
                                ),
                              ),
                            )),
                            Center(
                              child: Text(
                                '${snapShot.data![index].firstname} ${snapShot.data![index].lastname}',
                                style: MyTheme.lightTheme.textTheme.bodyText2!
                                    .copyWith(fontWeight: FontWeight.bold),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Text(
                              'My Contact'.tr(),
                              style: MyTheme.lightTheme.textTheme.bodyText2,
                            ),
                            SizedBox(height: size.height * 0.01),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01,
                                  horizontal: size.width * 0.02),
                              decoration: BoxDecoration(
                                  color: darkGrey,
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  proRow(
                                      size: size,
                                      icon: Icons.edit_location_rounded,
                                      content: 'Address'.tr(),
                                      data: snapShot.data![index].address1),
                                  proRow(
                                      size: size,
                                      icon: Icons.phone,
                                      content: 'Phone'.tr(),
                                      data: snapShot.data![index].telephone),
                                  proRow(
                                      size: size,
                                      icon: Icons.email,
                                      content: 'Email'.tr(),
                                      data: snapShot.data![index].email),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            Text(
                              'Personal Information'.tr(),
                              style: MyTheme.lightTheme.textTheme.bodyText2,
                            ),
                            SizedBox(height: size.height * 0.01),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01,
                                  horizontal: size.width * 0.02),
                              decoration: BoxDecoration(
                                  color: darkGrey,
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  proRow(
                                      size: size,
                                      icon: Icons.event_note,
                                      content: 'Status'.tr(),
                                      data: snapShot
                                          .data![index].customerGroupName),
                                  proRow(
                                      size: size,
                                      icon: Icons.qr_code_sharp,
                                      content: 'Code'.tr(),
                                      data: snapShot.data![index].code),
                                  proRow(
                                      size: size,
                                      icon: Icons.post_add,
                                      content: 'PostCode'.tr(),
                                      data: snapShot.data![index].postcode),
                                  proRow(
                                      size: size,
                                      icon: Icons.location_city,
                                      content: 'City'.tr(),
                                      data: snapShot.data![index].city)
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (_) => EditProfileScreen(
                                              firstName: snapShot
                                                  .data![index].firstname,
                                              lastName: snapShot
                                                  .data![index].lastname,
                                              address: snapShot
                                                  .data![index].address1,
                                              email:
                                                  snapShot.data![index].email,
                                              phone: snapShot
                                                  .data![index].telephone,
                                              status: snapShot.data![index]
                                                  .customerGroupName,
                                              zone: snapShot
                                                  .data![index].zoneName,
                                              city: snapShot.data![index].city,
                                              postal: snapShot
                                                  .data![index].postcode,
                                            )));
                              },
                              child: Center(
                                child: Card(
                                  color: mainColor,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.02,
                                        vertical: size.height * 0.005),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Edit'.tr(),
                                          style: MyTheme
                                              .lightTheme.textTheme.subtitle1!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: whiteColor),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.01,
                                        ),
                                        const Icon(
                                          Icons.edit,
                                          color: whiteColor,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                          ],
                        );
                      });
                } else {
                  return loading();
                }
              },
            ),
          ))
        ],
      ),
    ));
  }

  proRow({IconData? icon, dynamic size, String? content, String? data}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Colors.grey[600],
              size: 20,
            ),
            SizedBox(width: size.width * 0.01),
            Text(
              content!,
              style: MyTheme.lightTheme.textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.grey[600]),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ],
        ),
        Divider(
          color: Colors.grey[900],
        ),
        Text(
          data!,
          style: MyTheme.lightTheme.textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.bold),
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
        SizedBox(
          height: size.height * 0.02,
        )
      ],
    );
  }
}
