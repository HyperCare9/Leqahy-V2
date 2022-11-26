class MenuHeaderModel {
  String? topID;
  String? level1ID;
  String? level2ID;
  String? topName;
  String? level1Name;
  String? level2Name;

  MenuHeaderModel({
    this.topID,
    this.level1ID,
    this.level2ID,
    this.topName,
    this.level1Name,
    this.level2Name,
  });

  factory MenuHeaderModel.fromJson(Map<String, dynamic> json) {
    MenuHeaderModel menuHeaderModel = MenuHeaderModel();
    menuHeaderModel.topID = json['top'];
    menuHeaderModel.level1ID = json['level1'];
    menuHeaderModel.level2ID = json['level2'];
    menuHeaderModel.topName = json['topname'];
    menuHeaderModel.level1Name = json['level1name'];
    menuHeaderModel.level2Name = json['level2name'];
    return menuHeaderModel;
  }
}
