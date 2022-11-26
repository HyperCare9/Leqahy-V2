import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../Model/doctor_model/addApoinment_model.dart';
import '../../Model/doctor_model/cancelAppoinment_model.dart';
import '../../Model/doctor_model/customer_appoinment_Model.dart';
import '../../Model/doctor_model/doctor_info_model.dart';
import '../../Model/doctor_model/doctor_model.dart';
import '../../Model/doctor_model/workTime_model.dart';
import '../../Repository/Doctor_Repository/doctor_repository.dart';

import '../../Constant/string.dart';

class DoctorServices extends DoctorRepository {
  @override
  Future<List<DoctorModel>> getAllDoctors({String? languageID}) async {
    String url = 'get-main-t_doctors';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"language_id": languageID});
    List<DoctorModel> doctorModel = [];

    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Doctors']);
        doctorModel = decoded.map((e) => DoctorModel.fromJson(e)).toList();
        return doctorModel;
      }
    } catch (e) {
      print(e);
    }
    return doctorModel;
  }

  @override
  Future<WorkTimeModel> getWorkTime({String? doctorID, String? date}) async {
    String url = 'work-doctor-appointments';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"doctor_id": doctorID, "day_date": date});
    WorkTimeModel workTimeModel = WorkTimeModel();
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        workTimeModel = WorkTimeModel.fromJson(data);
        return workTimeModel;
      }
    } catch (e) {
      print(e);
    }
    return workTimeModel;
  }

  @override
  Future<AddAppoinmentModel> bookDoctor(
      {String? doctorID,
      String? customerID,
      String? time,
      String? date}) async {
    String url = 'get-main-t_add_appointment';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "doctor_id": doctorID,
      "customer_id": customerID,
      "appointment_time": time,
      "appointment_date": date,
    });
    AddAppoinmentModel addAppoinmentModel = AddAppoinmentModel();
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        addAppoinmentModel = AddAppoinmentModel.fromJson(data);
        return addAppoinmentModel;
      }
    } catch (e) {
      print(e);
    }
    return addAppoinmentModel;
  }

  @override
  Future<List<DoctorInfoModel>> getDoctorsInfo(
      {String? doctorID, String? languageID}) async {
    String url = 'get-doctor-details';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"doctor_id": doctorID, "language_id": languageID});
    List<DoctorInfoModel> doctorInfoModel = [];

    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Doctor Details']);
        doctorInfoModel =
            decoded.map((e) => DoctorInfoModel.fromJson(e)).toList();
        return doctorInfoModel;
      }
    } catch (e) {
      print(e);
    }
    return doctorInfoModel;
  }

  @override
  Future<List<CustomerAppoinmentModel>> getCusAppoinment(
      {String? customerID, String? languageID}) async {
    String url = 'get_allCustomerAppointments';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body =
        jsonEncode({"customer_id": customerID, "language_id": languageID});
    List<CustomerAppoinmentModel> cusAppoinmentMode = [];
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Customer Appointments']);
        cusAppoinmentMode =
            decoded.map((e) => CustomerAppoinmentModel.fromJson(e)).toList();
        return cusAppoinmentMode;
      }
    } catch (e) {
      print(e);
    }
    return cusAppoinmentMode;
  }

  @override
  Future<CancelAppoinmentModel> cancelAppoinment(
      {String? doctorID,
      String? customerID,
      String? time,
      String? date}) async {
    String url = 'cancel_CustomerAppointment';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "doctor_id": doctorID,
      "customer_id": customerID,
      "appointment_time": time,
      "appointment_date": date,
    });
    CancelAppoinmentModel cancelAppoinmentModel = CancelAppoinmentModel();
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        cancelAppoinmentModel = CancelAppoinmentModel.fromJson(data);
        return cancelAppoinmentModel;
      }
    } catch (e) {
      print(e);
    }
    return cancelAppoinmentModel;
  }
}
