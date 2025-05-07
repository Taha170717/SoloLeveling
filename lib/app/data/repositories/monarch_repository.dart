import 'package:get/get.dart';
import 'package:shadow_monarch/app/data/models/monarch_model.dart';
import 'package:shadow_monarch/app/data/providers/api_provider.dart';

class MonarchRepository {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();

  Future<List<MonarchModel>> getMonarchs() async {
    return await _apiProvider.getMonarchs();
  }

  Future<MonarchModel> getMonarchById(String id) async {
    return await _apiProvider.getMonarchById(id);
  }
}
