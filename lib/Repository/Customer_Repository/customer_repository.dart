import '../../Model/Customer_model/customer_model.dart';
import '../../Model/Customer_model/groupCustomer_model.dart';
import '../../Model/Customer_model/updateCustomer_model.dart';

abstract class CustomerRepository {
  Future<List<GroupCustomerModel>> getGroupCustomer({String? languageID});
  Future<List<CustomerModel>> getCustomerData({String? customerID});
  Future<UpdateCustomerModel> updateCustomer({
    String? customerID,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? address,
    String? groupID,
    String? phone,
    String? zoneID,
    String? countryID,
    String? city,
    String? postal,
  });
}
