import '../../Model/labvaccine_model/vaccineProduct_model.dart';
import '../../Model/labvaccine_model/vaccine_model.dart';

abstract class VaccinationRepository {
  Future<List<VaccineModel>> getVaccine({String? languageId});
  Future<VaccineProductModel> sendVaccination(
      {String? cusName,
      String? cusNumber,
      String? labName,
      String? checkCount,
      String? date,
      String? reserveName,
      List<Map<String, dynamic>>? details});
}
