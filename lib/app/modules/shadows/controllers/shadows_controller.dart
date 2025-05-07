import 'package:get/get.dart';
import 'package:shadow_monarch/app/data/models/shadow_model.dart';
import 'package:shadow_monarch/app/data/repositories/shadow_repository.dart';

class ShadowsController extends GetxController {
  final ShadowRepository _shadowRepository = Get.find<ShadowRepository>();
  
  final RxBool isLoading = false.obs;
  final RxList<ShadowModel> shadows = <ShadowModel>[].obs;
  final RxString searchQuery = ''.obs;
  
  @override
  void onInit() {
    super.onInit();
    _loadShadows();
  }
  
  void _loadShadows() async {
    isLoading.value = true;
    try {
      final result = await _shadowRepository.getShadows();
      shadows.value = result;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load shadows');
    } finally {
      isLoading.value = false;
    }
  }
  
  List<ShadowModel> get filteredShadows {
    if (searchQuery.value.isEmpty) {
      return shadows;
    }
    return shadows.where((shadow) => 
      shadow.name.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
      shadow.rank.toLowerCase().contains(searchQuery.value.toLowerCase())
    ).toList();
  }
  
  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}
