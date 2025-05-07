import 'package:get/get.dart';
import 'package:shadow_monarch/app/data/models/hunter_model.dart';
import 'package:shadow_monarch/app/data/repositories/hunter_repository.dart';

class HunterDetailController extends GetxController {
  final HunterRepository _hunterRepository = Get.find<HunterRepository>();
  
  final Rx<HunterModel?> hunter = Rx<HunterModel?>(null);
  final RxBool isLoading = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    final String id = Get.arguments as String;
    _loadHunter(id);
  }
  
  void _loadHunter(String id) async {
    isLoading.value = true;
    try {
      final result = await _hunterRepository.getHunterById(id);
      hunter.value = result;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load hunter details');
    } finally {
      isLoading.value = false;
    }
  }
}
