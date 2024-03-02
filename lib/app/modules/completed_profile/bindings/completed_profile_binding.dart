import 'package:get/get.dart';

import '../controllers/completed_profile_controller.dart';

class CompletedProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompletedProfileController>(
      () => CompletedProfileController(),
    );
  }
}
