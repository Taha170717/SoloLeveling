import 'package:get/get.dart';
import 'package:shadow_monarch/app/data/models/hunter_model.dart';
import 'package:shadow_monarch/app/data/providers/api_provider.dart';

class HunterRepository {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();

  Future<List<HunterModel>> getHunters() async {
    return await _apiProvider.getHunters();
  }

  Future<HunterModel> getHunterById(String id) async {
    return await _apiProvider.getHunterById(id);
  }
}
