import 'package:get/get.dart';
import 'package:shadow_monarch/app/data/models/shadow_model.dart';
import 'package:shadow_monarch/app/data/models/hunter_model.dart';
import 'package:shadow_monarch/app/data/models/monarch_model.dart';
import 'package:shadow_monarch/app/data/repositories/shadow_repository.dart';
import 'package:shadow_monarch/app/data/repositories/hunter_repository.dart';
import 'package:shadow_monarch/app/data/repositories/monarch_repository.dart';

class HomeController extends GetxController {
  final ShadowRepository _shadowRepository = Get.find<ShadowRepository>();
  final HunterRepository _hunterRepository = Get.find<HunterRepository>();
  final MonarchRepository _monarchRepository = Get.find<MonarchRepository>();
  
  final RxInt currentIndex = 0.obs;
  final RxBool isLoading = false.obs;
  
  final RxList<ShadowModel> featuredShadows = <ShadowModel>[].obs;
  final RxList<HunterModel> featuredHunters = <HunterModel>[].obs;
  final RxList<MonarchModel> featuredMonarchs = <MonarchModel>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    _loadFeaturedData();
  }
  
  void _loadFeaturedData() async {
    isLoading.value = true;
    try {
      final shadows = await _shadowRepository.getShadows();
      final hunters = await _hunterRepository.getHunters();
      final monarchs = await _monarchRepository.getMonarchs();
      
      featuredShadows.value = shadows.take(3).toList();
      featuredHunters.value = hunters.take(3).toList();
      featuredMonarchs.value = monarchs.take(3).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load featured data');
    } finally {
      isLoading.value = false;
    }
  }
  
  void changeTab(int index) {
    currentIndex.value = index;
  }
}
