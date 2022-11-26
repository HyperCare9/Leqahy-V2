import 'package:leqahy_v2/Constant/string.dart';

class InitailRoute {
  String route({String? routeEN, String? routeAR}) {
    return LanguageData().language == '1' ? '$routeEN' : '$routeAR';
  }
}
