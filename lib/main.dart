import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:intl/date_symbol_data_local.dart';
import 'package:leqahy_v2/Constant/cachHelper.dart';
import 'package:leqahy_v2/Constant/colors.dart';
import 'package:leqahy_v2/Constant/string.dart';
import 'package:leqahy_v2/Views/Screens/AccademyScreen/accademy_screen.dart';
import 'package:leqahy_v2/Views/Screens/AntisepticsScreen/antiseptics_screen.dart';
import 'package:leqahy_v2/Views/Screens/BoardingScreen/boardingScreen.dart';
import 'package:leqahy_v2/Views/Screens/CategoryScreen/category_screen.dart';
import 'package:leqahy_v2/Views/Screens/HomeScreen/mainScreen.dart';
import 'package:leqahy_v2/Views/Screens/LoginScreen/deletion_screen.dart';
import 'package:leqahy_v2/Views/Screens/LoginScreen/registerScreen.dart';
import 'package:leqahy_v2/Views/Screens/OrderScreen/order_product_screen.dart';
import 'package:leqahy_v2/Views/Screens/ProfileScreen/profileScreen.dart';
import 'package:leqahy_v2/Views/Screens/Setting_screen/setting_screen.dart';
import 'package:leqahy_v2/Views/Screens/doctorScreen/doctorScreen.dart';
import 'package:leqahy_v2/Views/Screens/stockmarketScreen/stockmarket_screen.dart';
import 'package:leqahy_v2/Views/Screens/vaccineScreen/vaccineScreen.dart';
import 'Constant/initial_route.dart';
import 'Constant/theme.dart';
import 'Views/Screens/LabVaccinationScreen/labvaccination_screen.dart';
import 'Views/Screens/LoginScreen/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initializeDateFormatting();
  await EasyLocalization.ensureInitialized();
  await CachHelper.init();
  await Firebase.initializeApp();
  DatabaseReference ref =
      FirebaseDatabase.instance.ref("leqahy_main_links/baseURL");

  DatabaseEvent event = await ref.once();
  // var res = await FirebaseFirestore.instance
  //     .collection('Links')
  //     .doc('6fm76MsB8OgrPJqPPefV')
  //     .get();

  CachHelper.saveData(key: 'baseurl', value: event.snapshot.value);
  //comment
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: whiteColor,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(EasyLocalization(
      startLocale: const Locale('ar', 'EG'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
      ],
      saveLocale: true,
      fallbackLocale: const Locale('en', 'US'),
      path: 'assets/languages',
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    if (LanguageData().language == null) {
      if (context.locale == const Locale('en', 'US')) {
        CachHelper.saveData(key: 'Lang', value: '1');
      } else {
        CachHelper.saveData(key: 'Lang', value: '2');
      }
    }

    if (CustomerData().isFirstInitail == null) {
      CachHelper.saveData(key: 'isFirst', value: true);
    }
    if (CustomerData().cusID == null) {
      CachHelper.saveData(key: 'cusID', value: '0');
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Leqahy',
      theme: MyTheme.lightTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: CustomerData().isFirstInitail == true
          ? BoardingScreen.routeName
          : CustomerData().cusID == '0'
              ? LoginScreen.routeName
              : MainScreen.routeName,
      routes: {
        BoardingScreen.routeName: (_) => const BoardingScreen(),
        InitailRoute().route(routeEN: 'Logout', routeAR: 'تسجيل الخروج'): (_) =>
            const LoginScreen(),
        RegisterScreen.routeName: (_) => const RegisterScreen(),
        InitailRoute().route(routeEN: 'Home', routeAR: 'الرئيسيه'): (_) =>
            const MainScreen(),
        InitailRoute().route(routeEN: 'Stockmarket', routeAR: 'البورصه'): (_) =>
            const StockMarketScreen(),
        InitailRoute().route(
            routeEN: 'Lab Vaccination',
            routeAR: 'تحصينات المعمل'): (_) => const LabVaccinationScreen(),
        InitailRoute().route(routeEN: 'Doctors', routeAR: 'الدكاتره'): (_) =>
            const DoctorScreen(),
        InitailRoute().route(routeEN: 'Vaccines', routeAR: 'لقاحات'): (_) =>
            VaccineScreen(),
        InitailRoute().route(routeEN: 'Antiseptics', routeAR: 'مطهرات'): (_) =>
            AntisepticsScreen(),
        InitailRoute().route(routeEN: 'Academy', routeAR: 'الأكاديميه'): (_) =>
            const AccademyScreen(),
        InitailRoute().route(routeEN: 'Settings', routeAR: 'الإعدادت'): (_) =>
            const SettingScreen(),
        InitailRoute()
                .route(routeEN: 'Order product', routeAR: 'المنتجات المطلوبه'):
            (_) => const SingleOrderProductScreen(),
        InitailRoute().route(routeEN: 'Profile', routeAR: 'الصفحه الشخصيه'):
            (_) => const ProfileScreen(),
        InitailRoute().route(routeEN: 'Filter', routeAR: 'تصنيف'): (_) =>
            const CategoriesScreen(),
        InitailRoute().route(
            routeEN: 'Delete Account',
            routeAR: 'حذف الحساب الشخصى'): (_) => const DeletionScreen()
      },
    );
  }
}
