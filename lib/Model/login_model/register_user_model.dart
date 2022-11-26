class RegisterUserModel {
  int? customerId;
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
  String? createdAt;
  String? updatedAt;
  String? widthLine;
  String? heightLine;
  String? imageProfile;

  RegisterUserModel({
    this.customerId,
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
    this.createdAt,
    this.updatedAt,
    this.widthLine,
    this.heightLine,
    this.imageProfile,
  });

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) {
    RegisterUserModel registerUserModel = RegisterUserModel();
    registerUserModel.customerId = json["customer_id"];
    registerUserModel.customerGroupId = json["customer_group_id"];
    registerUserModel.storeId = json["store_id"];
    registerUserModel.languageId = json["language_id"];
    registerUserModel.firstname = json["firstname"];
    registerUserModel.lastname = json["lastname"];
    registerUserModel.email = json["email"];
    registerUserModel.telephone = json["telephone"];
    registerUserModel.fax = json["fax"];
    registerUserModel.salt = json["salt"];
    registerUserModel.cart = json["cart"];
    registerUserModel.wishlist = json["wishlist"];
    registerUserModel.newsletter = json["newsletter"];
    registerUserModel.addressId = json["address_id"];
    registerUserModel.customField = json["custom_field"];
    registerUserModel.ip = json["ip"];
    registerUserModel.status = json["status"];
    registerUserModel.safe = json["safe"];
    registerUserModel.token = json["token"];
    registerUserModel.code = json["code"];
    registerUserModel.createdAt = json["created_at"];
    registerUserModel.updatedAt = json["updated_at"];
    registerUserModel.widthLine = json["width_line"];
    registerUserModel.heightLine = json["height_line"];
    registerUserModel.imageProfile = json["image_profile"];
    return registerUserModel;
  }
}
