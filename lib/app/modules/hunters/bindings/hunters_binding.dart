import 'package:get/get.dart';
import 'package:shadow_monarch/app/modules/hunters/controllers/hunters_controller.dart';

class HuntersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HuntersController>(HuntersController());
  }
}
