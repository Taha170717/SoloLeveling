import 'package:get/get.dart';
import 'package:shadow_monarch/app/data/models/monarch_model.dart';
import 'package:shadow_monarch/app/data/repositories/monarch_repository.dart';

class MonarchDetailController extends GetxController {
  final MonarchRepository _monarchRepository = Get.find<MonarchRepository>();
  
  final Rx<MonarchModel?> monarch = Rx<MonarchModel?>(null);
  final RxBool isLoading = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    final String id = Get.arguments as String;
    _loadMonarch(id);
  }
  
  void _loadMonarch(String id) async {
    isLoading.value = true;
    try {
      final result = await _monarchRepository.getMonarchById(id);
      monarch.value = result;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load monarch details');
    } finally {
      isLoading.value = false;
    }
  }
}
