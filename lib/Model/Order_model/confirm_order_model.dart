class ConfirmOrderModel {
  bool? status;
  String? errNum;
  String? msg;
  // OrderModel? orderModel;

  ConfirmOrderModel({
    this.status,
    this.errNum,
    this.msg,
    // this.orderModel,
  });

  factory ConfirmOrderModel.fromJson(Map<String, dynamic> json) {
    ConfirmOrderModel confirmOrderModel = ConfirmOrderModel();
    confirmOrderModel.status = json['status'];
    confirmOrderModel.errNum = json['errNum'];
    confirmOrderModel.msg = json['msg'];
    // confirmOrderModel.orderModel = OrderModel.fromJson(json['Order Details']);
    return confirmOrderModel;
  }
}
