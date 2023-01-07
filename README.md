# Flutter Assessment

![App Screenshot](screenshot.png)

This repo contains a simple mobile app with the backend powered by [Pocketbase](https://pocketbase.io) and the front-end in Flutter.

## Getting Started

You need to have docker and flutter 3.3.0 installed on your machine to run this.

To start the backend:

```
docker-compose up -d
```

The admin username is `hello@genopets.me` and the password is `flutter-assessment`.

The security rules have been set to be fully public. There is no authentication needed to CRUD anything in the database.

Then you may run the Flutter app in an emulator as usual, you should be able to see the above screen.

## Architecture

The Flutter application uses the following libraries:

- [MobX](https://pub.dev/packages/mobx)

This is used for state management. MobX follows the Reactive Programming paradigm and uses code generation to prevent too much boilerplate

- [Flutter Modular](https://pub.dev/packages/flutter_modular)

This is used for dependency-injection. Namely, we use it to inject the MobX store `app_store` wherever we need it
