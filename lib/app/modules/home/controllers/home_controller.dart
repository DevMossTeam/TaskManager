import 'package:get/get.dart';
import '../../../models/task_model.dart';

class HomeController extends GetxController {
  var tasks = <TaskModel>[].obs;

  void addTask(TaskModel task) {
    tasks.add(task);
  }
}
