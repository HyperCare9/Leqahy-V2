class CancelProductOrderModel {
  bool? status;
  String? errNum;
  String? msg;
  String? orderCancelation;

  CancelProductOrderModel({
    this.status,
    this.errNum,
    this.msg,
    this.orderCancelation,
  });

  factory CancelProductOrderModel.fromJson(Map<String, dynamic> json) {
    CancelProductOrderModel orderCancelationModel = CancelProductOrderModel();
    orderCancelationModel.status = json['status'];
    orderCancelationModel.errNum = json['errNum'];
    orderCancelationModel.msg = json['msg'];
    orderCancelationModel.orderCancelation = json['Order Product Cancelation'];
    return orderCancelationModel;
  }
}
