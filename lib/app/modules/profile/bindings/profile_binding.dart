import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // Menggunakan lazyPut, controller hanya dibuat saat diperlukan
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
