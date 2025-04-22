import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

import '../modules/add_task/bindings/add_task_binding.dart';
import '../modules/add_task/views/add_task_view.dart';

import '../modules/checklist/bindings/checklist_binding.dart';
import '../modules/checklist/views/checklist_view.dart';

import '../modules/calendar/bindings/calendar_binding.dart';
import '../modules/calendar/views/calendar_view.dart';

import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

abstract class Routes {
  static const HOME = '/';
  static const ADD_TASK = '/add-task';
  static const CHECKLIST = '/checklist';
  static const CALENDAR = '/calendar';
  static const PROFILE = '/profile';
}

class AppPages {
  static const initial = Routes.HOME;

 static final List<GetPage> routes = [
  GetPage(
    name: Routes.HOME,
    page: () => HomeView(),
    binding: HomeBinding(),  // Ensure this binding is set
  ),
  GetPage(
    name: Routes.ADD_TASK,
    page: () => AddTaskView(),
    binding: AddTaskBinding(), // Correct binding
  ),
  GetPage(
    name: Routes.CHECKLIST,
    page: () => const ChecklistView(),
    binding: ChecklistBinding(),
  ),
  GetPage(
    name: Routes.CALENDAR,
    page: () => const CalendarView(),
    binding: CalendarBinding(),
  ),
  GetPage(
    name: Routes.PROFILE,
    page: () => const ProfileView(),
    binding: ProfileBinding(),
  ),
];
}
