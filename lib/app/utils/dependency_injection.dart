import 'package:get/get.dart';
import 'package:shadow_monarch/app/data/repositories/shadow_repository.dart';
import 'package:shadow_monarch/app/data/repositories/hunter_repository.dart';
import 'package:shadow_monarch/app/data/repositories/monarch_repository.dart';
import 'package:shadow_monarch/app/data/providers/api_provider.dart';

class DependencyInjection {
  static Future<void> init() async {
    // API Provider
    Get.lazyPut<ApiProvider>(() => ApiProvider(), fenix: true);
    
    // Repositories
    Get.lazyPut<ShadowRepository>(() => ShadowRepository(), fenix: true);
    Get.lazyPut<HunterRepository>(() => HunterRepository(), fenix: true);
    Get.lazyPut<MonarchRepository>(() => MonarchRepository(), fenix: true);
  }
}
