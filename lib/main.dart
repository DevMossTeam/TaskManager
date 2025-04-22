import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/app/routes/app_pages.dart';

// Import all controllers:
import 'app/modules/home/controllers/home_controller.dart';
import 'app/modules/checklist/controllers/checklist_controller.dart';
import 'app/modules/calendar/controllers/calendar_controller.dart';
import 'app/modules/profile/controllers/profile_controller.dart';

// Import all the views
import 'app/modules/home/views/home_view.dart';
import 'app/modules/add_task/views/add_task_view.dart';
import 'app/modules/checklist/views/checklist_view.dart';
import 'app/modules/calendar/views/calendar_view.dart';
import 'app/modules/profile/views/profile_view.dart';

void main() {
  // Daftarkan semua controller secara lazy sebelum runApp
  Get.lazyPut<HomeController>(()         => HomeController());
  Get.lazyPut<ChecklistController>(()    => ChecklistController());
  Get.lazyPut<CalendarController>(()     => CalendarController());
  Get.lazyPut<ProfileController>(()      => ProfileController());
  // (AddTaskController sudah di‑lazyPut di AddTaskBinding saat navigasi ke AddTaskView)

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
      getPages: AppPages.routes,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Daftar halaman/tab
  final List<Widget> _pages = [
    HomeView(),
    const ChecklistView(),
    const CalendarView(),
    const ProfileView(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tampilkan halaman sesuai index:
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),

      // FAB dipusatkan
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_TASK),
        backgroundColor: const Color(0xFF282828),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(Icons.add, size: 28),
      ),

      // BottomAppBar
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1A1A1A),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        elevation: 8,
        child: SizedBox(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home_outlined),
                color: _currentIndex == 0 ? Colors.white : Colors.white70,
                onPressed: () => _onTabTapped(0),
              ),
              IconButton(
                icon: const Icon(Icons.checklist_outlined),
                color: _currentIndex == 1 ? Colors.white : Colors.white70,
                onPressed: () => _onTabTapped(1),
              ),
              const SizedBox(width: 48), // Ruang untuk FAB
              IconButton(
                icon: const Icon(Icons.calendar_today_outlined),
                color: _currentIndex == 2 ? Colors.white : Colors.white70,
                onPressed: () => _onTabTapped(2),
              ),
              IconButton(
                icon: const Icon(Icons.person_outline),
                color: _currentIndex == 3 ? Colors.white : Colors.white70,
                onPressed: () => _onTabTapped(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
