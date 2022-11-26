import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Constant/string.dart';
import '../../../Constant/theme.dart';
import '../../../Model/doctor_model/cancelAppoinment_model.dart';
import '../../../Model/doctor_model/customer_appoinment_Model.dart';
import '../../../Services/doctor_Services/doctor_services.dart';
import '../../Widget/General_Widget/buildToast.dart';
import '../../Widget/General_Widget/loading.dart';
import '../../Widget/General_Widget/pageTitle.dart';
import '../../Widget/productWidget/noProductWidget.dart';
import 'package:intl/intl.dart' as inital;
import '../../../Constant/colors.dart';
import '../../Widget/General_Widget/buildHeader.dart';

class AppoinmentScreen extends StatefulWidget {
  const AppoinmentScreen({Key? key}) : super(key: key);

  @override
  State<AppoinmentScreen> createState() => _AppoinmentScreenState();
}

class _AppoinmentScreenState extends State<AppoinmentScreen> {
  FToast toast = FToast();
  CancelAppoinmentModel? cancelAppoinmentModel;

  @override
  void initState() {
    super.initState();
    toast.init(context);
    inital.Intl.defaultLocale = 'en';
  }

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
          pageTitle(context: context, size: size, text: 'All Appoinments'.tr()),
          SizedBox(height: size.height * 0.015),
          Expanded(
              child: FutureBuilder<List<CustomerAppoinmentModel>>(
            future: DoctorServices().getCusAppoinment(
              customerID: CustomerData().cusID.toString(),
              languageID:
                  context.locale == const Locale('en', 'US') ? '1' : '2',
            ),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return snapShot.data!.isNotEmpty
                    ? ListView.builder(
                        itemCount: snapShot.data!.length,
                        itemBuilder: (context, index) {
                          int reverseIndex = snapShot.data!.length - 1 - index;
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: size.width * 0.02,
                                horizontal: size.height * 0.01),
                            margin: EdgeInsets.symmetric(
                                vertical: size.width * 0.02,
                                horizontal: size.height * 0.02),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(color: darkGrey, width: 2.0),
                                gradient: const LinearGradient(
                                    colors: [
                                      whiteColor,
                                      whiteColor,
                                      darkGrey,
                                      darkGrey,
                                      darkGrey
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Row(
                              children: [
                                Center(
                                    child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  maxRadius: 46,
                                  backgroundImage: const AssetImage(
                                      'assets/images/logoMark.png'),
                                  child: CircleAvatar(
                                    maxRadius: 32,
                                    backgroundColor: whiteColor,
                                    backgroundImage: snapShot
                                                .data![reverseIndex]
                                                .doctorImage !=
                                            ''
                                        ? NetworkImage(snapShot
                                            .data![reverseIndex].doctorImage!)
                                        : const NetworkImage(
                                            'https://leqahyapp.hypercare-eg.com/media/image/notfound/no-order.png'),
                                  ),
                                )),
                                Expanded(
                                    child: Padding(
                                  padding:
                                      EdgeInsets.only(left: size.width * 0.02),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapShot.data![reverseIndex].name!,
                                        style: MyTheme
                                            .lightTheme.textTheme.subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              style: MyTheme.lightTheme
                                                  .textTheme.subtitle2,
                                              children: [
                                            TextSpan(text: 'Date : '.tr()),
                                            TextSpan(
                                                text: snapShot
                                                    .data![reverseIndex]
                                                    .appointmentDate)
                                          ])),
                                      RichText(
                                          text: TextSpan(
                                              style: MyTheme.lightTheme
                                                  .textTheme.subtitle2,
                                              children: [
                                            TextSpan(text: 'Time : '.tr()),
                                            TextSpan(
                                                text: snapShot
                                                    .data![reverseIndex]
                                                    .appointmentTime)
                                          ])),
                                      Divider(
                                        color: Colors.grey[500],
                                        thickness: 2.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Card(
                                            color: snapShot.data![reverseIndex]
                                                        .status ==
                                                    '0'
                                                ? Colors.orange
                                                : snapShot.data![reverseIndex]
                                                            .status ==
                                                        '1'
                                                    ? Colors.green
                                                    : Colors.red,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text(
                                                snapShot.data![reverseIndex]
                                                            .status ==
                                                        '0'
                                                    ? 'Time out'.tr()
                                                    : snapShot
                                                                .data![
                                                                    reverseIndex]
                                                                .status ==
                                                            '1'
                                                        ? 'Active'.tr()
                                                        : 'Canceled'.tr(),
                                                style: MyTheme.lightTheme
                                                    .textTheme.subtitle2!
                                                    .copyWith(
                                                        color: whiteColor),
                                              ),
                                            ),
                                          ),
                                          snapShot.data![reverseIndex].status ==
                                                  '1'
                                              ? InkWell(
                                                  onTap: () async {
                                                    cancelAppoinmentModel =
                                                        await DoctorServices().cancelAppoinment(
                                                            customerID:
                                                                CustomerData()
                                                                    .cusID
                                                                    .toString(),
                                                            doctorID: snapShot
                                                                .data![
                                                                    reverseIndex]
                                                                .doctorId,
                                                            date: snapShot
                                                                .data![
                                                                    reverseIndex]
                                                                .appointmentDate,
                                                            time: snapShot
                                                                .data![
                                                                    reverseIndex]
                                                                .appointmentTime);
                                                    if (cancelAppoinmentModel!
                                                            .status ==
                                                        true) {
                                                      showBottomToast(
                                                          colors: Colors.green,
                                                          icon: Icons.check,
                                                          toast: toast,
                                                          message:
                                                              'Cancel Appoinment Success'
                                                                  .tr());
                                                      setState(() {});
                                                    } else {
                                                      showBottomToast(
                                                          colors: Colors.red,
                                                          icon: Icons.warning,
                                                          toast: toast,
                                                          message:
                                                              'Cancel Appoinment Faield'
                                                                  .tr());
                                                    }
                                                  },
                                                  child: Card(
                                                    color: Colors.red,
                                                    child: Padding(
                                                      padding: EdgeInsets
                                                          .symmetric(
                                                              horizontal:
                                                                  size.width *
                                                                      0.015,
                                                              vertical:
                                                                  size.height *
                                                                      0.005),
                                                      child: Text(
                                                        'Cancel'.tr(),
                                                        style: MyTheme
                                                            .lightTheme
                                                            .textTheme
                                                            .subtitle2!
                                                            .copyWith(
                                                                color:
                                                                    whiteColor),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container()
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          );
                        })
                    : noCompanyWidget(message: 'No Appoinment founded'.tr());
              } else {
                return loading();
              }
            },
          ))
        ],
      ),
    ));
  }
}
