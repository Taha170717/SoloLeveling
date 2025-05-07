import 'package:get/get.dart';
import 'package:shadow_monarch/app/data/models/monarch_model.dart';
import 'package:shadow_monarch/app/data/repositories/monarch_repository.dart';

class MonarchsController extends GetxController {
  final MonarchRepository _monarchRepository = Get.find<MonarchRepository>();
  
  final RxBool isLoading = false.obs;
  final RxList<MonarchModel> monarchs = <MonarchModel>[].obs;
  final RxString searchQuery = ''.obs;
  
  @override
  void onInit() {
    super.onInit();
    _loadMonarchs();
  }
  
  void _loadMonarchs() async {
    isLoading.value = true;
    try {
      final result = await _monarchRepository.getMonarchs();
      monarchs.value = result;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load monarchs');
    } finally {
      isLoading.value = false;
    }
  }
  
  List<MonarchModel> get filteredMonarchs {
    if (searchQuery.value.isEmpty) {
      return monarchs;
    }
    return monarchs.where((monarch) => 
      monarch.name.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
      monarch.title.toLowerCase().contains(searchQuery.value.toLowerCase())
    ).toList();
  }
  
  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}
