import '../../Model/doctor_model/addApoinment_model.dart';
import '../../Model/doctor_model/cancelAppoinment_model.dart';
import '../../Model/doctor_model/customer_appoinment_Model.dart';
import '../../Model/doctor_model/doctor_info_model.dart';
import '../../Model/doctor_model/doctor_model.dart';
import '../../Model/doctor_model/workTime_model.dart';

abstract class DoctorRepository {
  Future<List<DoctorModel>> getAllDoctors({String? languageID});
  Future<List<DoctorInfoModel>> getDoctorsInfo(
      {String? doctorID, String? languageID});
  Future<WorkTimeModel> getWorkTime({
    String? doctorID,
    String? date,
  });
  Future<AddAppoinmentModel> bookDoctor({
    String? doctorID,
    String? customerID,
    String? time,
    String? date,
  });
  Future<List<CustomerAppoinmentModel>> getCusAppoinment(
      {String? customerID, String? languageID});

  Future<CancelAppoinmentModel> cancelAppoinment({
    String? doctorID,
    String? customerID,
    String? time,
    String? date,
  });
}
