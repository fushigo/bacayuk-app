import 'package:bacayuk/app/modules/completed_profile/controllers/completed_profile_controller.dart';
import 'package:get/get.dart';

class CompletedProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompletedProfileController>(
      () => CompletedProfileController(),
    );
  }
}
