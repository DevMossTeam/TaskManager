import 'package:get/get.dart';
import '../controllers/calendar_controller.dart';

class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    // Menggunakan lazyPut, controller hanya dibuat saat diperlukan
    Get.lazyPut<CalendarController>(() => CalendarController());
  }
}
