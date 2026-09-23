# Global Connect

Global Connect is a Flutter application that helps users discover and connect with people based on their interests and location.

The app allows users to create profiles, find people with similar interests, chat with them, and communicate across different languages.

## Features

* User registration and login using Firebase Authentication
* Discover nearby users using location
* Match users based on common interests
* Interest similarity calculated using Jaccard Similarity
* Real-time chat using Cloud Firestore
* Language translation
* User profiles
* Map-based user discovery

## Tech Stack

* Flutter
* Dart
* Firebase Authentication
* Cloud Firestore
* Firebase Storage
* Geolocator
* Flutter Map
* OpenStreetMap
* Translation API

## How matching works

Users can add their interests as hashtags.

The application compares the interests of two users using Jaccard Similarity:

```text
Jaccard Similarity = Intersection of interests / Union of interests
```

A higher similarity score means the users have more interests in common.

## Running the project

Clone the repository:

```bash
git clone https://github.com/SaiSreePeruboyina/Global-Connectt.git
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

For web:

```bash
flutter run -d chrome
```

## Live Demo

https://global-connectt.vercel.app/

The web deployment currently contains the application's onboarding and UI flow.

## Project

Built with Flutter and Firebase as a location and interest-based social networking application.
