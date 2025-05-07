import 'package:get/get.dart';
import 'package:shadow_monarch/app/modules/monarch_detail/controllers/monarch_detail_controller.dart';

class MonarchDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MonarchDetailController>(MonarchDetailController());
  }
}
