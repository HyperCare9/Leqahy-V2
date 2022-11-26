class RemoveCartModel {
  bool? status;
  String? errNum;
  String? msg;
  int? deleteID;

  RemoveCartModel({
    this.status,
    this.errNum,
    this.msg,
    this.deleteID,
  });

  factory RemoveCartModel.fromJson(Map<String, dynamic> json) {
    RemoveCartModel removeItemModel = RemoveCartModel();
    removeItemModel.status = json['status'];
    removeItemModel.errNum = json['errNum'];
    removeItemModel.msg = json['msg'];
    removeItemModel.deleteID = json['Your Cart'];
    return removeItemModel;
  }
}
