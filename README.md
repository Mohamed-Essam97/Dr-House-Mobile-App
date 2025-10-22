# Dr-House-Mobile App

A modern Flutter application for medical services and doctor appointments.

## Features

- 🏥 Doctor Appointments
- 👨‍⚕️ Doctor Profiles and Specialties
- 📱 User Authentication
- 🌐 Multi-language Support (English, Arabic, German)
- 🎨 Modern UI/UX Design
- 🔍 Search and Filter Doctors
- 📅 Appointment Management
- 👤 User Profile Management
- 🔔 Push Notifications
- 📝 Blog Section

## Tech Stack

- Flutter
- Bloc Pattern for State Management
- Clean Architecture
- Dependency Injection
- RESTful API Integration
- Local Storage
- Firebase Services

## Getting Started

### Prerequisites

- Flutter SDK (Latest Version)
- Dart SDK (Latest Version)
- Android Studio / VS Code
- iOS Development Setup (for Mac users)

### Installation

1. Clone the repository

```bash
git clone https://github.com/Mohamed-Essam97/Dr-House-Mobile-App.git
```

2. Navigate to project directory

```bash
cd Dr-House-Mobile-App
```

3. Install dependencies

```bash
flutter pub get
```

4. Run the app

```bash
flutter run
```

### Project Structure

```
lib/
├── app/                  # App configuration
├── blocs/               # Business Logic Components
├── data/                # Data layer
│   ├── datasources/     # Remote and Local data sources
│   ├── repositories/    # Repository implementations
│   └── utils/          # Utility functions
├── domain/              # Domain layer
│   ├── entities/        # Business entities
│   ├── models/         # Data models
│   └── params/         # Request/Response parameters
├── presentation/        # UI layer
│   ├── pages/          # App screens
│   ├── themes/         # App themes
│   └── widgets/        # Reusable widgets
└── screens/            # Main app screens
    ├── auth/           # Authentication screens
    ├── main_home_screen/# Home and main features
    └── onboarding_screen/# Onboarding flow
```

## Features in Detail

### Authentication

- Sign in with email/password
- Social media authentication
- Password recovery
- User registration

### Doctor Appointments

- Browse doctors by specialty
- View doctor profiles and reviews
- Book appointments
- Manage bookings
- Receive appointment reminders

### Multi-language Support

- English
- Arabic
- German
- Easy language switching

### Profile Management

- Edit personal information
- View appointment history
- Manage notifications
- Update preferences

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details

## Contact

Mohamed Essam - [@YourTwitter](https://twitter.com/YourTwitter)

Project Link: [https://github.com/Mohamed-Essam97/Dr-House-Mobile-App](https://github.com/Mohamed-Essam97/Dr-House-Mobile-App)
