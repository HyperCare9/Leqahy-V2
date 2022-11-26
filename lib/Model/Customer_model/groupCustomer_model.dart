// ignore_for_file: public_member_api_docs, sort_constructors_first
class GroupCustomerModel {
  String? customerGroupId;
  String? approval;
  String? sortOrder;
  String? languageId;
  String? name;
  String? description;

  GroupCustomerModel({
    this.customerGroupId,
    this.approval,
    this.sortOrder,
    this.languageId,
    this.name,
    this.description,
  });

  factory GroupCustomerModel.fromJson(Map<String, dynamic> json) {
    GroupCustomerModel groupCustomerModel = GroupCustomerModel();
    groupCustomerModel.customerGroupId = json['customer_group_id'];
    groupCustomerModel.approval = json['approval'];
    groupCustomerModel.sortOrder = json['sort_order'];
    groupCustomerModel.languageId = json['language_id'];
    groupCustomerModel.name = json['name'];
    groupCustomerModel.description = json['description'];
    return groupCustomerModel;
  }
}
