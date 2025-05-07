import 'package:get/get.dart';
import 'package:shadow_monarch/app/modules/monarchs/controllers/monarchs_controller.dart';

class MonarchsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MonarchsController>(MonarchsController());
  }
}
