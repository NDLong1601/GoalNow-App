# GoalNow
GoalNow is a Flutter mobile application designed to manage football-related content with a clean UI, scalable architecture, and reusable components.
The project focuses on best practices in Flutter development, including state management, modular structure, and production-ready UX patterns.
---

## ✨ Features

- 🔐 Authentication
  - Sign up / Sign in
  - User session handling

- 👤 Profile & Settings
  - View user profile
  - Edit name
  - Edit email with password verification
  - Change password
  - Default avatar support

- 🧩 Reusable Components
  - Custom AppButton
  - Custom AppTextField / AppPasswordField
  - Navigation items
  - Centralized styles & themes

- ⚠️ UX Enhancements
  - Form validation
  - Loading & error states
  - Success notifications (MaterialBanner)
  - Keyboard-safe layouts

---

## 🛠 Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **State Management:** Provider
- **Architecture:** Modular / Feature-based
- **UI Pattern:** Custom reusable components
- **Routing:** Named routes
- **Platform:** Android / iOS

---

## 📂 Project Structure

```text
lib/
├── component/          # Reusable UI components
│   ├── app_button.dart
│   ├── app_text.dart
│   ├── app_textfield.dart
│   └── app_navigation_item.dart
│
├── core/
│   ├── const/           # Colors, assets, constants
│   ├── enum/            # Enums
│   ├── utils/           # Helpers (format, avatar, etc.)
│
├── model/               # Data models
│   └── user.dart
│
├── provider/            # State management
│   └── user_provider.dart
│
├── routes/              # App routes
│   └── app_route.dart
│
├── screen/
│   ├── auth/            # Sign in / Sign up
│   ├── profile/         # Profile & settings
│   │   ├── edit_name_screen.dart
│   │   ├── edit_email_screen.dart
│   │   ├── change_password_screen.dart
│   │   └── widget/
│   │       ├── profile_header.dart
│   │       └── verify_password_dialog.dart
```

## 🚀 Getting Started
Prerequisites
Flutter SDK (>= 3.x)
Dart SDK
Android Studio / VS Code

Run the project
flutter pub get
flutter run

## 🧠 State Management & Architecture
Provider is used for managing user state (UserProvider)
UI listens to state changes via context.watch
Business logic is separated from UI
All async operations are guarded against context misuse
Navigation results are used to trigger UI feedback (success banners)

📱 Screens
Profile
Edit Name
Edit Email (with password verification)
Change Password

🔮 Future Improvements
Password strength indicator
Auto logout after password change
Backend integration (REST / GraphQL)
Unit & widget tests
Dark / Light theme toggle
👨‍💻 Author

Developed by NDLong161
