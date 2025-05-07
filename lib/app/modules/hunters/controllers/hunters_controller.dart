import 'package:get/get.dart';
import 'package:shadow_monarch/app/data/models/hunter_model.dart';
import 'package:shadow_monarch/app/data/repositories/hunter_repository.dart';

class HuntersController extends GetxController {
  final HunterRepository _hunterRepository = Get.find<HunterRepository>();
  
  final RxBool isLoading = false.obs;
  final RxList<HunterModel> hunters = <HunterModel>[].obs;
  final RxString searchQuery = ''.obs;
  
  @override
  void onInit() {
    super.onInit();
    _loadHunters();
  }
  
  void _loadHunters() async {
    isLoading.value = true;
    try {
      final result = await _hunterRepository.getHunters();
      hunters.value = result;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load hunters');
    } finally {
      isLoading.value = false;
    }
  }
  
  List<HunterModel> get filteredHunters {
    if (searchQuery.value.isEmpty) {
      return hunters;
    }
    return hunters.where((hunter) => 
      hunter.name.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
      hunter.rank.toLowerCase().contains(searchQuery.value.toLowerCase())
    ).toList();
  }
  
  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}
