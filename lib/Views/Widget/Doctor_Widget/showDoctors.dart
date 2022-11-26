import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';
import '../../../Model/doctor_model/doctor_model.dart';
import '../../../Services/doctor_Services/doctor_services.dart';
import '../../Screens/DoctorScreen/bookDoctor.dart';
import '../General_Widget/loading.dart';
import '../General_Widget/pageTitle.dart';

showDoctors(
    {dynamic size,
    String? languageID,
    required BuildContext context,
    required String doctorID}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      pageTitle(context: context, size: size, text: 'Another Doctor'.tr()),
      SizedBox(height: size.height * 0.015),
      Center(
        child: FutureBuilder<List<DoctorModel>>(
            future: DoctorServices().getAllDoctors(languageID: languageID),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.015,
                      vertical: size.height * 0.01),
                  height: size.height * 0.20,
                  width: size.width * 0.90,
                  decoration: BoxDecoration(
                      color: darkGrey,
                      borderRadius: BorderRadius.circular(12.0)),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapShot.data!.length,
                      itemBuilder: (context, index) {
                        return doctorID != snapShot.data![index].doctorId
                            ? InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (_) => BookDoctorScreen(
                                                doctorID: snapShot
                                                    .data![index].doctorId,
                                                doctorName: snapShot
                                                    .data![index].doctorName,
                                              )));
                                },
                                child: SizedBox(
                                  width: size.width * 0.29,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            side: const BorderSide(
                                                color: mainColor, width: 1.5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                              child: CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            maxRadius: 40,
                                            backgroundImage: const AssetImage(
                                                'assets/images/logoMark.png'),
                                            child: CircleAvatar(
                                              maxRadius: 24,
                                              backgroundColor: whiteColor,
                                              backgroundImage: snapShot
                                                          .data![index].image !=
                                                      ''
                                                  ? NetworkImage(snapShot
                                                      .data![index].image!)
                                                  : const NetworkImage(
                                                      'https://leqahyshop.hypercare-eg.com/image/catalog/loqa7y/Manufacturer/Medivac.jpeg'),
                                            ),
                                          )),
                                        ),
                                      ),
                                      SizedBox(height: size.height * 0.01),
                                      RichText(
                                          softWrap: true,
                                          overflow: TextOverflow.visible,
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                              style: MyTheme.lightTheme
                                                  .textTheme.subtitle2,
                                              children: [
                                                TextSpan(text: 'Dr.'.tr()),
                                                TextSpan(
                                                    text: snapShot.data![index]
                                                        .doctorName!)
                                              ]))
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox();
                      }),
                );
              } else {
                return loading();
              }
            }),
      ),
    ],
  );
}
