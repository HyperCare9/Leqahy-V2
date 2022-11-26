// this is the base url of our all application API
import 'cachHelper.dart';

String baseURL = CachHelper.getData(key: 'baseurl');

// this is the class with contain
class CustomerData {
  var isFirstInitail = CachHelper.getData(key: 'isFirst');
  var cusID = CachHelper.getData(key: 'cusID');
  var cusGroupID = CachHelper.getData(key: 'cusGroupID');
  var cusFirstName = CachHelper.getData(key: 'cusFirstName');
  var cusLastName = CachHelper.getData(key: 'cusLastName');
  var cusEmail = CachHelper.getData(key: 'cusEmail');
  var cusTele = CachHelper.getData(key: 'cusTele');
  var cusFax = CachHelper.getData(key: 'cusFax');
  var ipAddress = CachHelper.getData(key: 'IP');
}

class AddressData {
  var latitude = CachHelper.getData(key: 'Lat');
  var longitude = CachHelper.getData(key: 'Long');
  var address = CachHelper.getData(key: 'address');
}

class OrderData {
  var orderPayType = CachHelper.getData(key: 'Type');
}

class ZoneData {
  var zoneID = CachHelper.getData(key: 'zoneID');
  var zoneName = CachHelper.getData(key: 'zoneName');
  var zoneCodee = CachHelper.getData(key: 'zoneCode');
  var pZoneID = CachHelper.getData(key: 'P_zoneID');
  var pZoneName = CachHelper.getData(key: 'P_zoneName');
  var pZoneCodee = CachHelper.getData(key: 'P_zoneCode');
}

class ShippingData {
  var firstName = CachHelper.getData(key: 'FirstName');
  var lastName = CachHelper.getData(key: 'LastName');
  var company = CachHelper.getData(key: 'Company');
  var address = CachHelper.getData(key: 'address');
  var subAddress = CachHelper.getData(key: 'subAddress');
  var city = CachHelper.getData(key: 'city');
  var zone = CachHelper.getData(key: 'zone');
  var postal = CachHelper.getData(key: 'postal');
}

class PaymentData {
  var firstName = CachHelper.getData(key: 'P_FirstName');
  var lastName = CachHelper.getData(key: 'P_LastName');
  var company = CachHelper.getData(key: 'P_Company');
  var address = CachHelper.getData(key: 'P_address');
  var subAddress = CachHelper.getData(key: 'P_subAddress');
  var city = CachHelper.getData(key: 'P_city');
  var zone = CachHelper.getData(key: 'P_zone');
  var postal = CachHelper.getData(key: 'P_postal');
}

class LanguageData {
  var language = CachHelper.getData(key: 'Lang');
}
