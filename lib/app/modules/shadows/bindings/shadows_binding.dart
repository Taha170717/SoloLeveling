import 'package:get/get.dart';
import 'package:shadow_monarch/app/modules/shadows/controllers/shadows_controller.dart';

class ShadowsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ShadowsController>(ShadowsController());
  }
}
