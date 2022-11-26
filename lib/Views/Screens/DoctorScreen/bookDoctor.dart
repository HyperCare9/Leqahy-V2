import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart' as inital;
import '../../../Constant/colors.dart';
import '../../../Constant/string.dart';
import '../../../Constant/theme.dart';
import '../../../Model/doctor_model/addApoinment_model.dart';
import '../../../Model/doctor_model/workTime_model.dart';
import '../../../Services/doctor_Services/doctor_services.dart';
import '../../Widget/Doctor_Widget/noTime.dart';
import '../../Widget/Doctor_Widget/showDoctors.dart';
import '../../Widget/Doctor_Widget/timeCard.dart';
import '../../Widget/General_Widget/buildToast.dart';
import '../../Widget/General_Widget/loading.dart';

import '../../../Constant/setTime.dart';
import '../../Widget/General_Widget/buildHeader.dart';
import '../../Widget/General_Widget/pageTitle.dart';

class BookDoctorScreen extends StatefulWidget {
  String? doctorID;
  String? doctorName;
  static const String routeName = '/BookingScreen';
  BookDoctorScreen({Key? key, this.doctorID, this.doctorName})
      : super(key: key);

  @override
  State<BookDoctorScreen> createState() => _BookDoctorScreenState();
}

class _BookDoctorScreenState extends State<BookDoctorScreen> {
  DateTime date = DateTime.now();
  DateTime date1 = DateTime.now();
  List<bool> boolList = [];
  String? bookTime = '';
  AddAppoinmentModel? addAppoinmentModel;
  FToast fToast = FToast();
  List month = [
    'January'.tr(),
    'February'.tr(),
    'March'.tr(),
    'April'.tr(),
    'May'.tr(),
    'June'.tr(),
    'July'.tr(),
    'August'.tr(),
    'September'.tr(),
    'October'.tr(),
    'November'.tr(),
    'December'.tr(),
  ];

  @override
  void initState() {
    super.initState();
    fToast.init(context);
    inital.Intl.defaultLocale = 'en';
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int numofDays = date.day;
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
                boolList.clear();
              },
              sufFun: () {}),
          SizedBox(height: size.height * 0.01),
          Center(
            child: RichText(
                text: TextSpan(
                    style: MyTheme.lightTheme.textTheme.headline2!.copyWith(
                        fontWeight: FontWeight.bold, color: mainColor),
                    children: [
                  TextSpan(text: 'Dr /'.tr()),
                  TextSpan(text: ' ${widget.doctorName}')
                ])),
          ),
          SizedBox(height: size.height * 0.01),
          pageTitle(context: context, size: size, text: 'Book Doctors'.tr()),
          SizedBox(height: size.height * 0.02),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: size.width * 0.9,
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: darkGrey),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: size.height * 0.01),
                        Text(
                          'Select Date & Time'.tr(),
                          style: MyTheme.lightTheme.textTheme.bodyText1!
                              .copyWith(fontStyle: FontStyle.italic),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                date = date.subtract(Duration(days: numofDays));
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.arrow_left,
                                size: 40,
                                color: mainColor,
                              ),
                            ),
                            SizedBox(width: size.width * 0.02),
                            Text(
                              '${month[date.month - 1]} , ${date.year}'
                                  .toUpperCase(),
                              style: MyTheme.lightTheme.textTheme.bodyText2!
                                  .copyWith(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: size.width * 0.02),
                            InkWell(
                              onTap: () {
                                date = date.day == 28
                                    ? date.add(const Duration(days: 28))
                                    : date.day == 29
                                        ? date.add(const Duration(days: 29))
                                        : date.day == 30
                                            ? date.add(const Duration(days: 30))
                                            : date
                                                .add(const Duration(days: 30));
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.arrow_right,
                                size: 40,
                                color: mainColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.01),
                        DatePicker(
                          date.subtract(Duration(days: numofDays)),
                          initialSelectedDate: date,
                          daysCount: 32,
                          width: context.locale == const Locale('en', 'US')
                              ? size.width * 0.12
                              : size.width * 0.15,
                          height: size.height * 0.12,
                          selectedTextColor: Colors.white,
                          selectionColor: customBlue,
                          dateTextStyle:
                              MyTheme.lightTheme.textTheme.bodyText1!,
                          dayTextStyle: MyTheme.lightTheme.textTheme.subtitle2!
                              .copyWith(fontSize: 10.0),
                          monthTextStyle: MyTheme
                              .lightTheme.textTheme.subtitle2!
                              .copyWith(fontSize: 10.0),
                          locale: context.locale == const Locale('en', 'US')
                              ? 'en_US'
                              : 'ar_EG',
                          onDateChange: (dateTime) {
                            try {
                              setState(() {
                                date = dateTime;
                                boolList.clear();
                              });
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: mainColor, width: 2.0)),
                  ),
                  child: Text(
                    'Avaliable Solt'.tr(),
                    style: MyTheme.lightTheme.textTheme.headline2!.copyWith(
                        color: mainColor, fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        maxRadius: 5.0,
                        backgroundColor: customBlue,
                      ),
                      SizedBox(width: size.width * 0.02),
                      Text(
                        'Morning'.tr(),
                        style: MyTheme.lightTheme.textTheme.bodyText2,
                      )
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                SizedBox(
                  height: context.locale == const Locale('en', 'US')
                      ? size.height * 0.045
                      : size.height * 0.055,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.035),
                    child: FutureBuilder<WorkTimeModel>(
                        future: DoctorServices().getWorkTime(
                            doctorID: widget.doctorID,
                            date: inital.DateFormat('yyyy-MM-dd').format(date)),
                        builder: (context, snapShot) {
                          if (snapShot.hasData) {
                            // boolList.clear();
                            List.generate(snapShot.data!.times!.length,
                                (index) => boolList.add(false));
                            return snapShot.data!.times!.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapShot.data!.times!.length,
                                    itemBuilder: (context, index) {
                                      return int.parse(
                                                  '${snapShot.data!.times![index].substring(0, 2)}${snapShot.data!.times![index].substring(3, 5)}') <=
                                              1200
                                          ? timeCard(
                                              time:
                                                  '${snapShot.data!.times![index]}',
                                              duration: ' am'.tr(),
                                              size: size,
                                              isSelected: boolList.isNotEmpty &&
                                                      boolList.length > index
                                                  ? boolList[index]
                                                  : false,
                                              onTap: () {
                                                setState(() {
                                                  boolList.clear();
                                                  List.generate(
                                                      snapShot
                                                          .data!.times!.length,
                                                      (index) =>
                                                          boolList.add(false));
                                                  boolList[index] = true;
                                                  bookTime = snapShot
                                                      .data!.times![index];
                                                });
                                              })
                                          : const SizedBox();
                                    })
                                : noTime(size: size);
                          } else {
                            return loading();
                          }
                        }),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        maxRadius: 5.0,
                        backgroundColor: customBlue,
                      ),
                      SizedBox(width: size.width * 0.02),
                      Text(
                        'Evening'.tr(),
                        style: MyTheme.lightTheme.textTheme.bodyText2,
                      )
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                SizedBox(
                  height: context.locale == const Locale('en', 'US')
                      ? size.height * 0.045
                      : size.height * 0.055,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: FutureBuilder<WorkTimeModel>(
                        future: DoctorServices().getWorkTime(
                            doctorID: widget.doctorID,
                            date: inital.DateFormat('yyyy-MM-dd').format(date)),
                        builder: (context, snapShot) {
                          if (snapShot.hasData) {
                            return snapShot.data!.times!.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapShot.data!.times!.length,
                                    itemBuilder: (context, index) {
                                      return int.parse(
                                                  '${snapShot.data!.times![index].substring(0, 2)}${snapShot.data!.times![index].substring(3, 5)}') >
                                              1200
                                          ? timeCard(
                                              time:
                                                  '${setTime(time: snapShot.data!.times![index].substring(0, 2))}${snapShot.data!.times![index].substring(2, 5)}',
                                              duration: ' pm'.tr(),
                                              size: size,
                                              isSelected: boolList.isNotEmpty &&
                                                      boolList.length > index
                                                  ? boolList[index]
                                                  : false,
                                              onTap: () {
                                                setState(() {
                                                  boolList.clear();
                                                  List.generate(
                                                      snapShot
                                                          .data!.times!.length,
                                                      (index) =>
                                                          boolList.add(false));
                                                  boolList[index] = true;
                                                  bookTime = snapShot
                                                      .data!.times![index];
                                                });
                                              })
                                          : const SizedBox();
                                    })
                                : noTime(size: size);
                          } else {
                            return loading();
                          }
                        }),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          addAppoinmentModel = await DoctorServices()
                              .bookDoctor(
                                  customerID: CustomerData().cusID.toString(),
                                  doctorID: widget.doctorID,
                                  date: inital.DateFormat('yyyy-MM-dd')
                                      .format(date),
                                  time: bookTime);
                          if (addAppoinmentModel!.status == true) {
                            showBottomToast(
                                toast: fToast,
                                colors: Colors.green,
                                icon: Icons.check,
                                message: 'book doctor time success'.tr());
                            boolList.clear();
                            setState(() {});
                          } else {
                            showBottomToast(
                                toast: fToast,
                                colors: Colors.red,
                                icon: Icons.warning,
                                message: 'book doctor time Failed'.tr());
                          }
                        },
                        child: Text(
                          'Book now'.tr(),
                          style: MyTheme.lightTheme.textTheme.bodyText2!
                              .copyWith(color: whiteColor),
                        ))),
                SizedBox(height: size.height * 0.02),
                showDoctors(
                    context: context,
                    size: size,
                    doctorID: widget.doctorID!,
                    languageID:
                        context.locale == const Locale('en', 'US') ? '1' : '2'),
                SizedBox(height: size.height * 0.03),
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
