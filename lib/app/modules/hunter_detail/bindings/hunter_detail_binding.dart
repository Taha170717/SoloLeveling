import 'package:get/get.dart';
import 'package:shadow_monarch/app/modules/hunter_detail/controllers/hunter_detail_controller.dart';

class HunterDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HunterDetailController>(HunterDetailController());
  }
}
