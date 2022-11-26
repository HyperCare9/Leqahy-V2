class RemoveItemModel {
  bool? status;
  String? errNum;
  String? msg;
  int? deleteID;

  RemoveItemModel({
    this.status,
    this.errNum,
    this.msg,
    this.deleteID,
  });

  factory RemoveItemModel.fromJson(Map<String, dynamic> json) {
    RemoveItemModel removeItemModel = RemoveItemModel();
    removeItemModel.status = json['status'];
    removeItemModel.errNum = json['errNum'];
    removeItemModel.msg = json['msg'];
    removeItemModel.deleteID = json['Your Remaining Cart'];
    return removeItemModel;
  }
}
