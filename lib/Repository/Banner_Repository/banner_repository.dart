import '../../Model/banner_model/banner_model.dart';
import '../../Model/banner_model/banners_model.dart';

abstract class BannerRepository {
  Future<BannersModel> fetchBanners();
  Future<List<BannnerModel>> getBanner();
}
