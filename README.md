
# SuitMedia Test Intern


Aplikasi Flutter dengan arsitektur MVVM yang menggunakan BLoC untuk manajemen state, Dio untuk HTTP requests, Go Router untuk navigasi, dan Equatable untuk perbandingan objek.

## Struktur Proyek

```plaintext
lib/
├── core/
│   ├── api_services/
│   │   ├── main_app.dart
│   │   └── api_services/
│   │       ├── api_services.dart
│   │       └── endpoint.dart
│   ├── global_widget/
│   │   ├── app_bar.dart
│   │   ├── custom_button.dart
│   │   ├── custom_cardview.dart
│   │   ├── custom_textfield.dart
│   │   └── popup.dart
│   ├── utils/
│   │   ├── printlog_utils.dart
│   │   └── route_utils.dart
│   └── constants/
│       ├── color.dart
│       ├── font.dart
│       ├── images.dart
│       └── string.dart
├── data/
│   └── auth/
│       ├── datasource/
│       │   └── auth_data_source.dart
│       └── responsesmodel/
│           └── auth_responses_model.dart
└── features/
    ├── first/
    │   └── first_screen.dart
    ├── second/
    │   └── second_screen.dart
    └── third/
        ├── bloc/
        │   ├── user_bloc.dart
        │   ├── user_state.dart
        │   └── user_event.dart
        └── third_screen.dart

test/
└── datasource/
    └── auth_datasource_test.dart
```

## Tech Stack

- **BLoC** - Manajemen state menggunakan bloc pattern.
- **Dio** - Untuk HTTP requests dan komunikasi dengan API.
- **Go Router** - Navigasi berbasis declarative routing.
- **Equatable** - Untuk mempermudah perbandingan objek.

## Cara Menjalankan

1. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

2. **Jalankan Aplikasi:**
   ```bash
   flutter run
   ```

3. **Menjalankan Test:**
   ```bash
   flutter test
   ```
