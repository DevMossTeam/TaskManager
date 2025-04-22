import 'package:get/get.dart';

class ChecklistController extends GetxController {
  // Contoh daftar item checklist
  final items = <String>[].obs;

  void addItem(String text) {
    if (text.isNotEmpty) {
      items.add(text);
    }
  }

  void removeItem(int index) {
    items.removeAt(index);
  }
}
