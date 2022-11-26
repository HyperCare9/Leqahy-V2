// ignore_for_file: public_member_api_docs, sort_constructors_first
class SideMenuModel {
  String? sideMenuId;
  String? sideMenuName;
  String? status;
  String? image;

  SideMenuModel({
    this.sideMenuId,
    this.sideMenuName,
    this.status,
    this.image,
  });

  factory SideMenuModel.fromJson(Map<String, dynamic> json) {
    SideMenuModel sideMenu = SideMenuModel();
    sideMenu.sideMenuId = json['side_menu_id'];
    sideMenu.sideMenuName = json['side_menu_name'];
    sideMenu.status = json['status'];
    sideMenu.image = json['image'];
    return sideMenu;
  }
}
