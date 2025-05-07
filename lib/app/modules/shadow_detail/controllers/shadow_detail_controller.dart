import 'package:get/get.dart';
import 'package:shadow_monarch/app/data/models/shadow_model.dart';
import 'package:shadow_monarch/app/data/repositories/shadow_repository.dart';

class ShadowDetailController extends GetxController {
  final ShadowRepository _shadowRepository = Get.find<ShadowRepository>();
  
  final Rx<ShadowModel?> shadow = Rx<ShadowModel?>(null);
  final RxBool isLoading = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    final String id = Get.arguments as String;
    _loadShadow(id);
  }
  
  void _loadShadow(String id) async {
    isLoading.value = true;
    try {
      final result = await _shadowRepository.getShadowById(id);
      shadow.value = result;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load shadow details');
    } finally {
      isLoading.value = false;
    }
  }
}
