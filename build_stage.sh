#!/bin/bash
PATH_PROJECT=$(pwd)
APP_NAME=${PWD##*/}

# build apk
flutter clean
flutter pub get
flutter build apk --release --flavor stage -t lib/main_stage.dart
flutter build appbundle --flavor stage -t lib/main_stage.dart --target-platform android-arm,android-arm64,android-x64

# move file app-release.aab to folder certs
cp "$PATH_PROJECT/build/app/outputs/flutter-apk/app-stage-release.apk" "$PATH_PROJECT/${APP_NAME}_stage.apk"
cp "$PATH_PROJECT/build/app/outputs/bundle/stageRelease/app-stage-release.aab" "$PATH_PROJECT/${APP_NAME}_stage.aab"