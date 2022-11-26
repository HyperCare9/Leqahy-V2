// ignore_for_file: public_member_api_docs, sort_constructors_first
class CheckOutModel {
  int? shipping;
  int? discount;
  int? fees;
  int? subTotal;
  int? total;

  CheckOutModel({
    this.shipping,
    this.discount,
    this.fees,
    this.subTotal,
    this.total,
  });

  factory CheckOutModel.fromJson(Map<String, dynamic> json) {
    CheckOutModel checkOutModel = CheckOutModel();
    checkOutModel.shipping = json['Shipping'];
    checkOutModel.discount = json['Discount'];
    checkOutModel.fees = json['Fees'];
    checkOutModel.subTotal = json['Sub Total'];
    checkOutModel.total = json['Total'];
    return checkOutModel;
  }
}
