// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leqahy_v2/Model/doctor_model/doctor_info_model.dart';
import 'package:leqahy_v2/Services/doctor_Services/doctor_services.dart';
import 'package:leqahy_v2/Views/Widget/Doctor_Widget/doctorData.dart';
import 'package:leqahy_v2/Views/Widget/General_Widget/loading.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';
import '../../Widget/General_Widget/buildHeader.dart';

class DoctorDetails extends StatefulWidget {
  String? doctorID;
  DoctorDetails({Key? key, this.doctorID}) : super(key: key);

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
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
          Expanded(
              child: FutureBuilder<List<DoctorInfoModel>>(
                  future: DoctorServices().getDoctorsInfo(
                      doctorID: widget.doctorID,
                      languageID: context.locale == const Locale('en', 'US')
                          ? '1'
                          : '2'),
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      return ListView.builder(
                          itemCount: snapShot.data!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Center(
                                    child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  maxRadius: 60,
                                  backgroundImage: const AssetImage(
                                      'assets/images/logoMark.png'),
                                  child: CircleAvatar(
                                    maxRadius: 41,
                                    backgroundColor: whiteColor,
                                    backgroundImage: snapShot
                                                .data![index].image !=
                                            ''
                                        ? NetworkImage(
                                            snapShot.data![index].image!)
                                        : const NetworkImage(
                                            'https://leqahyshop.hypercare-eg.com/image/catalog/loqa7y/Manufacturer/Medivac.jpeg'),
                                  ),
                                )),
                                SizedBox(height: size.height * 0.01),
                                Center(
                                  child: RichText(
                                      text: TextSpan(
                                          style: MyTheme
                                              .lightTheme.textTheme.headline2!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: mainColor),
                                          children: [
                                        TextSpan(text: 'Dr /'.tr()),
                                        TextSpan(
                                            text:
                                                ' ${snapShot.data![index].doctorName}')
                                      ])),
                                ),
                                SizedBox(height: size.height * 0.02),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03),
                                  child: Text(
                                    snapShot.data![index].description!,
                                    style: MyTheme
                                        .lightTheme.textTheme.subtitle1!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.02),
                                doctorData(
                                    size: size,
                                    title: 'Email'.tr(),
                                    content: snapShot.data![index].email),
                                SizedBox(height: size.height * 0.01),
                                doctorData(
                                    size: size,
                                    title: 'Phone'.tr(),
                                    content: snapShot.data![index].telephone),
                                SizedBox(height: size.height * 0.01),
                                doctorData(
                                    size: size,
                                    title: 'Day Off'.tr(),
                                    content: snapShot.data![index].dayOff),
                              ],
                            );
                          });
                    } else {
                      return loading();
                    }
                  }))
        ],
      ),
    ));
  }
}
