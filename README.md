```
lib/
│
├── main.dart                            <-- Root widget (FAB & BottomNav di sini)
│
├── app/
│   ├── models/
│   │   └── task_model.dart              <-- Model data Task
│   │
│   ├── routes/
│   │   └── app_pages.dart               <-- Routing menggunakan GetX (opsional)
│   │
│   ├── modules/
│   │   ├── home/
│   │   │   ├── bindings/
│   │   │   │   └── home_binding.dart
│   │   │   ├── controllers/
│   │   │   │   └── home_controller.dart
│   │   │   ├── views/
│   │   │   │   └── home_view.dart       <-- Tampilan daftar Task
│   │   │
│   │   ├── add_task/
│   │   │   ├── bindings/
│   │   │   │   └── add_task_binding.dart
│   │   │   ├── controllers/
│   │   │   │   └── add_task_controller.dart
│   │   │   ├── views/
│   │   │   │   └── add_task_view.dart   <-- Form untuk tambah task
│   │   │
│   │   ├── checklist/
│   │   │   └── views/
│   │   │       └── checklist_view.dart  <-- Placeholder (opsional)
│   │   │
│   │   ├── calendar/
│   │   │   └── views/
│   │   │       └── calendar_view.dart   <-- Placeholder (opsional)
│   │   │
│   │   ├── profile/
│   │       └── views/
│   │           └── profile_view.dart    <-- Placeholder (opsional)
│   │
│   ├── widgets/
│   │   └── task_card.dart               <-- Komponen kartu task
```
