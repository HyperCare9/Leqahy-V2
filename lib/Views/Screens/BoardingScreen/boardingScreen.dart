import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';
import '../../../Services/IP.dart';
import '../LoginScreen/loginScreen.dart';

import '../../../Constant/cachHelper.dart';

class BoardingScreen extends StatefulWidget {
  static const String routeName = '/BoardingScreen';
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  double lat = 0.0;
  double long = 0.0;
  String address = '';
  @override
  void initState() {
    super.initState();
    IpInfoAPI.getIPADdress();
    getLocation();
    getLonAndLat();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: size.width * 0.20,
              height: size.height * 0.15,
            ),
          ),
          Text(
            'Welcome..!'.tr(),
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 40),
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: MyTheme.lightTheme.textTheme.subtitle2!
                      .copyWith(color: Colors.grey),
                  children: [
                    TextSpan(text: 'welcome to our app'.tr()),
                    const TextSpan(text: '\n'),
                    TextSpan(
                        text: 'leqahey you can use this app easily and'.tr()),
                    const TextSpan(text: '\n'),
                    TextSpan(text: 'do what you want from many functions'.tr()),
                  ])),
          Image.asset(
            'assets/images/boarding.png',
            width: size.width * 0.8,
            height: size.height * 0.35,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: whiteColor,
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  side: const BorderSide(color: Colors.grey)),
              onPressed: () {
                try {
                  CachHelper.saveData(key: 'isFirst', value: false);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const LoginScreen()));
                } catch (e) {
                  print(e);
                }
              },
              child: Text(
                'Get Started'.tr(),
                style: MyTheme.lightTheme.textTheme.subtitle1!
                    .copyWith(color: Colors.grey),
              ))
        ],
      ),
    ));
  }

  Future<Position> getLocation() async {
    bool service;
    LocationPermission permission;
    service = await Geolocator.isLocationServiceEnabled();
    if (service == false) {}
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permission are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future getLonAndLat() async {
    try {
      Position position = await getLocation();
      lat = position.latitude;
      long = position.longitude;
      getAddress(position);
      CachHelper.saveData(key: 'Lat', value: lat);
      CachHelper.saveData(key: 'Long', value: long);
      if (mounted) setState(() {});
    } catch (e) {
      print(e);
    }
  }

  Future getAddress(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address = '${place.street},${place.locality},${place.country}';
    CachHelper.saveData(key: 'address', value: address);
    if (mounted) setState(() {});
  }
}
