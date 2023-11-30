# DevFest 2023 Flutter Code Sample

## Flutter Version
Flutter 3.13.7

## How to Use

- Install [Flutter](https://flutter.dev/get-started/) and validate its installation with `flutter doctor -v`
- Clone this repository with `git clone git@github.com:yusufhnf/devfest23_flutter_cubit.git`
- Go to project root and execute the following command in console to get the required dependencies: `flutter pub get`
- This project uses `inject` library that works with code generation, execute the following command to generate files: `flutter packages pub run build_runner build --delete-conflicting-outputs`

### BLoC Cubit Freezed

You need to run `flutter packages pub run build_runner build --delete-conflicting-outputs` every time you add or modify models or blocs (especially modifying states).

### GetIt Injectable

You need to run `flutter packages pub run build_runner build --delete-conflicting-outputs` every time you add or remove @singleton and @lazySingleton.