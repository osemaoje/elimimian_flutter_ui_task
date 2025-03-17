# Elimimian Flutter UI Task

A Flutter project demonstrating best practices in architecture, testing, and CI/CD.

---

## 🚀 Setup Instructions
Follow these steps to set up and run the project locally:

### 1️⃣ Clone the Repository
```sh
git clone https://github.com/osemaoje/elimimian_flutter_ui_task.git
cd elimimian_flutter_ui_task
```

### 2️⃣ Install Dependencies
```sh
flutter pub get
```

### 3️⃣ Run the App
```sh
flutter run
```

---

## 🏛 Architecture Decisions

### **State Management**
- Utilized **Riverpod** for efficient and scalable state management.

### **Folder Structure**
The project follows a feature-based folder structure for better scalability and maintainability:

```
lib/
│── pages/            # UI Screens
│── widgets/          # Reusable UI Components
│── providers/        # State Management Files
│── routes/           # Go Router
│── utils/            # Utilities (e.g., Colors, Helpers)
│── main.dart         # App Entry Point
```

---

## 📸 UI Screenshots
Below are some screenshots demonstrating the app's UI across different screen sizes:

![Screenshot_1](https://github.com/user-attachments/assets/1f2aaa6c-6fc8-4b67-ba76-ec3f590c8ba8)
![Screenshot_2](https://github.com/user-attachments/assets/be662539-25d7-4f45-aefe-bf287f31883c)
![Screenshot_3](https://github.com/user-attachments/assets/4009f551-27a5-4fbf-84ad-31a770da97fe)

---

## 🧪 Testing
### **Run Widget Tests**
Execute the following commands to run widget tests:
```sh
flutter test
flutter test test/main_test.dart
```

### **Example Widget Test (`test/main_test.dart`)**
```dart
import 'package:eimimian_flutter_developer_coding_task/main.dart';
import 'package:eimimian_flutter_developer_coding_task/pages/main_page.dart';
import 'package:eimimian_flutter_developer_coding_task/pages/post_page.dart';
import 'package:eimimian_flutter_developer_coding_task/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('App starts on MainPage and navigates to PostPage', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Check if MainPage is displayed
    expect(find.byType(MainPage), findsOneWidget);

    // Simulate navigation to PostPage
    final router = GoRouter.of(tester.element(find.byType(MyApp)));
    router.goNamed(RouteNames.postPage);
    await tester.pumpAndSettle();

    // Check if PostPage is displayed
    expect(find.byType(PostPage), findsOneWidget);
  });
}
```

---

## 🔄 Continuous Integration (GitHub Actions)
This project uses **GitHub Actions** for automated testing on every push and pull request.

### **GitHub Actions Workflow (`.github/workflows/flutter_test.yml`)**
```yaml
name: Flutter CI

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Set up Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: "3.x"

      - name: Install dependencies
        run: flutter pub get

      - name: Run widget tests
        run: flutter test
```

---
