import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/controllers/home_controller.dart';
import '../../../models/task_model.dart';

class AddTaskController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void saveTask() {
    if (titleController.text.trim().isEmpty) return;

    final task = TaskModel(
      title: titleController.text,
      description: descriptionController.text,
    );

    Get.find<HomeController>().addTask(task);
    Get.back();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
