import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/checklist_controller.dart';

class ChecklistView extends GetView<ChecklistController> {
  const ChecklistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Checklist',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.items.isEmpty) {
            return const Center(
              child: Text(
                'No items in your checklist',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: controller.items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) {
              return ListTile(
                tileColor: const Color(0xFF1F1F1F),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                title: Text(
                  controller.items[i],
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                  onPressed: () => controller.removeItem(i),
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // contoh prompt input
          Get.defaultDialog(
            title: 'Add Item',
            content: TextField(
              onSubmitted: (val) {
                controller.addItem(val);
                Get.back();
              },
              decoration: const InputDecoration(hintText: 'Enter item'),
            ),
          );
        },
        backgroundColor: const Color(0xFF282828),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
