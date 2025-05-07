import 'package:get/get.dart';
import 'package:shadow_monarch/app/modules/shadow_detail/controllers/shadow_detail_controller.dart';

class ShadowDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ShadowDetailController>(ShadowDetailController());
  }
}
