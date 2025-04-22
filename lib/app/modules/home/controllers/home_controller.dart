import 'package:get/get.dart';
import 'package:taskmanager/app/models/task_model.dart';

class HomeController extends GetxController {
  /// Reactive list of TaskModel
  final RxList<TaskModel> tasks = <TaskModel>[].obs;

  /// Add a new task
  void addTask(TaskModel task) {
    tasks.add(task);
  }

  /// Remove a task by index
  void removeTask(int index) {
    tasks.removeAt(index);
  }

  /// Clear all tasks
  void clearTasks() {
    tasks.clear();
  }
}
