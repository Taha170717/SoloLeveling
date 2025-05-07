import 'package:get/get.dart';
import 'package:shadow_monarch/app/data/models/shadow_model.dart';
import 'package:shadow_monarch/app/data/providers/api_provider.dart';

class ShadowRepository {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();

  Future<List<ShadowModel>> getShadows() async {
    return await _apiProvider.getShadows();
  }

  Future<ShadowModel> getShadowById(String id) async {
    return await _apiProvider.getShadowById(id);
  }
}
