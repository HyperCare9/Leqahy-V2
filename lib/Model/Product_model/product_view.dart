// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductViewModel {
  bool? status;
  String? errNum;
  String? msg;
  String? productView;

  ProductViewModel({
    this.status,
    this.errNum,
    this.msg,
    this.productView,
  });

  factory ProductViewModel.fromJson(Map<String, dynamic> json) {
    ProductViewModel productViewModel = ProductViewModel();
    productViewModel.status = json['status'];
    productViewModel.errNum = json['errNum'];
    productViewModel.msg = json['msg'];
    productViewModel.productView = json['Product View'];
    return productViewModel;
  }
}
