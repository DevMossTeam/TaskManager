import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Calendar',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.events.isEmpty) {
            return const Center(
              child: Text(
                'No calendar events',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: controller.events.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) => ListTile(
              tileColor: const Color(0xFF1F1F1F),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              title: Text(
                controller.events[i],
                style: const TextStyle(color: Colors.white),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.event_busy, color: Colors.redAccent),
                onPressed: () => controller.removeEvent(i),
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
            title: 'Add Event',
            content: TextField(
              onSubmitted: (val) {
                controller.addEvent(val);
                Get.back();
              },
              decoration: const InputDecoration(hintText: 'Event title'),
            ),
          );
        },
        backgroundColor: const Color(0xFF282828),
        child: const Icon(Icons.event, color: Colors.white),
      ),
    );
  }
}
