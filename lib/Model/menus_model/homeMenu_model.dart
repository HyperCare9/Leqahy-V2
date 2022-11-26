class HomeMenuModel {
  int? classId;
  String? classCode;
  String? classDescription;
  String? languageId;
  String? name;
  String? status;
  String? image;

  HomeMenuModel({
    this.classId,
    this.classCode,
    this.classDescription,
    this.languageId,
    this.name,
    this.status,
    this.image,
  });

  factory HomeMenuModel.fromJson(Map<String, dynamic> json) {
    HomeMenuModel homeMenu = HomeMenuModel();
    homeMenu.classId = json['class_id'];
    homeMenu.classCode = json['class_code'];
    homeMenu.classDescription = json['class_description'];
    homeMenu.languageId = json['language_id'];
    homeMenu.name = json['name'];
    homeMenu.status = json['status'];
    homeMenu.image = json['image'];
    return homeMenu;
  }
}
