import 'package:leqahy_v2/Model/menus_model/homeMenu_model.dart';
import 'package:leqahy_v2/Model/menus_model/sideMenu_model.dart';

abstract class MenusBarRepository {
  Future<List<HomeMenuModel>> getHomeMenu(
      {String? languageID, String? platformName});
  Future<List<SideMenuModel>> getSideMenu(
      {String? languageID, String? platformName});
}
