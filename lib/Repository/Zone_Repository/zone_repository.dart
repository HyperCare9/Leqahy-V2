import '../../Model/Zone_model/zone_model.dart';

abstract class ZoneRepository {
  Future<List<ZoneModel>> getAllZones({String? countryID});
}
