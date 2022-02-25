#!/bin/bash
PATH_PROJECT=$(pwd)
APP_NAME=${PWD##*/}

# build apk
flutter clean
flutter pub get
flutter build apk --release --flavor pro -t lib/main_prod.dart
flutter build appbundle --flavor pro -t lib/main_prod.dart --target-platform android-arm,android-arm64,android-x64

# move file app-release.aab to folder certs
cp "$PATH_PROJECT/build/app/outputs/flutter-apk/app-pro-release.apk" "$PATH_PROJECT/${APP_NAME}_prod.apk"
cp "$PATH_PROJECT/build/app/outputs/bundle/proRelease/app-pro-release.aab" "$PATH_PROJECT/${APP_NAME}_prod.aab"