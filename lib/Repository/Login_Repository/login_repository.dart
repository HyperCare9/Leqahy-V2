import 'package:leqahy_v2/Model/login_model/delete_user_model.dart';

import '../../Model/login_model/login_model.dart';
import '../../Model/login_model/register_model.dart';

abstract class LoginRepository {
  Future<LoginModel> userLogin({String? email, String? password});
  Future<RegisterModel> userRegister(
      {String? firstName,
      String? lastName,
      String? customerGroupID,
      String? email,
      String? phone,
      String? password,
      String? address,
      String? languageID,
      String? ip,
      String? code,
      String? latuide,
      String? longtuide,
      String? zoneID,
      String? countryID,
      String? city,
      String? postalCode});
  Future<DeleteUserModel> deleteAccount({String? email, String? password});
}
