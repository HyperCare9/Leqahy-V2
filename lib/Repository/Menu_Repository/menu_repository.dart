import '../../Model/menu_model/menu_header_model.dart';
import '../../Model/menu_model/menu_product_model.dart';

abstract class MenuRepostiory {
  Future<List<MenuHeaderModel>> getMenuHeader(
      {String? languageID, String? categoryID, String? code});
  Future<List<MenuHeaderModel>> getMainMenu({String? languageID});

  Future<List<MenuProductModel>> getProductByCategory(
      {String? customerID, String? categoryID, String? languageID});
}
