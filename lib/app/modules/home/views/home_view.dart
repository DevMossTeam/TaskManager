import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../add_task/views/add_task_view.dart';
import '../widgets/task_card.dart';

class HomeView extends StatelessWidget {
  // Hapus `const` constructor karena controller bukan constant
  HomeView({Key? key}) : super(key: key);

  // Inisialisasi controller di level field (non-const)
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task Manager")),
      body: Obx(() {
        if (controller.tasks.isEmpty) {
          return const Center(child: Text("No tasks yet."));
        }
        return ListView.builder(
          itemCount: controller.tasks.length,
          itemBuilder: (context, index) {
            return TaskCard(task: controller.tasks[index]);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddTaskView()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
