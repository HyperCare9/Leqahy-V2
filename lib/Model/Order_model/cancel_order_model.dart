class OrderCancelationModel {
  bool? status;
  String? errNum;
  String? msg;
  String? orderCancelation;

  OrderCancelationModel({
    this.status,
    this.errNum,
    this.msg,
    this.orderCancelation,
  });

  factory OrderCancelationModel.fromJson(Map<String, dynamic> json) {
    OrderCancelationModel orderCancelationModel = OrderCancelationModel();
    orderCancelationModel.status = json['status'];
    orderCancelationModel.errNum = json['errNum'];
    orderCancelationModel.msg = json['msg'];
    orderCancelationModel.orderCancelation = json['Order Cancelation'];
    return orderCancelationModel;
  }
}
