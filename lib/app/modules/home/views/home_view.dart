import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/task_card.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  // Mengambil controller dengan Get.find(), akan memicu lazyPut jika controller belum ada
  final HomeController controller = Get.find<HomeController>(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Task Manager',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          final tasks = controller.tasks;
          if (tasks.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.task_alt_outlined, size: 72, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No tasks yet',
                      style: TextStyle(color: Colors.grey, fontSize: 18)),
                  SizedBox(height: 8),
                  Text('Tap + to add your first task',
                      style: TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: tasks.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) => TaskCard(task: tasks[i]),
          );
        }),
      ),
    );
  }
}
