// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  int? id;
  String? customerGroupId;
  String? storeId;
  String? languageId;
  String? firstname;
  String? lastname;
  String? email;
  String? telephone;
  String? fax;
  String? salt;
  String? cart;
  String? wishlist;
  String? newsletter;
  String? addressId;
  String? customField;
  String? ip;
  String? status;
  String? safe;
  String? token;
  String? code;
  String? dateAdded;
  String? createdAt;
  String? updatedAt;
  String? apiToken;

  UserModel({
    this.id,
    this.customerGroupId,
    this.storeId,
    this.languageId,
    this.firstname,
    this.lastname,
    this.email,
    this.telephone,
    this.fax,
    this.salt,
    this.cart,
    this.wishlist,
    this.newsletter,
    this.addressId,
    this.customField,
    this.ip,
    this.status,
    this.safe,
    this.token,
    this.code,
    this.dateAdded,
    this.createdAt,
    this.updatedAt,
    this.apiToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    UserModel userModel = UserModel();
    userModel.id = json['customer_id'];
    userModel.customerGroupId = json['customer_group_id'];
    userModel.storeId = json['store_id'];
    userModel.languageId = json['language_id'];
    userModel.firstname = json['firstname'];
    userModel.lastname = json['lastname'];
    userModel.email = json['email'];
    userModel.telephone = json['telephone'];
    userModel.fax = json['fax'];
    userModel.salt = json['salt'];
    userModel.cart = json['cart'];
    userModel.wishlist = json['wishlist'];
    userModel.newsletter = json['newsletter'];
    userModel.addressId = json['address_id'];
    userModel.customField = json['custom_field'];
    userModel.ip = json['ip'];
    userModel.status = json['status'];
    userModel.safe = json['safe'];
    userModel.token = json['token'];
    userModel.code = json['code'];
    userModel.dateAdded = json['date_added'];
    userModel.createdAt = json['created_at'];
    userModel.updatedAt = json['updated_at'];
    userModel.apiToken = json['api_token'];
    return userModel;
  }
}
