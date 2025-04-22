import 'package:get/get.dart';

class CalendarController extends GetxController {
  // Contoh daftar event string
  final events = <String>[].obs;

  void addEvent(String title) {
    if (title.isNotEmpty) {
      events.add(title);
    }
  }

  void removeEvent(int index) {
    events.removeAt(index);
  }
}
