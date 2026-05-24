#!/bin/sh

## Backup
if [ -d "backup/" ]; then
  echo "Directory exists."
  rm -r backup/
fi

## Android
mkdir -p backup/android/app/src/main/res

if [ -f "android/app/google-services.json" ]; then
  cp android/app/google-services.json backup/android/app/
fi

if [ -f "android/app/src/main/ic_launcher-playstore.png" ]; then
  cp android/app/src/main/ic_launcher-playstore.png backup/android/app/src/main
fi

cp android/app/src/main/AndroidManifest.xml backup/android/app/src/main
cp -R android/app/src/main/res/ backup/android/app/src/main/res 

## iOS 
mkdir -p backup/ios/Runner/Assets.xcassets

if [ -f "ios/Runner/GoogleService-Info.plist" ]; then
  cp ios/Runner/GoogleService-Info.plist ios/Runner/Info.plist backup/ios/Runner
fi

cp -R ios/Runner/Assets.xcassets/ backup/ios/Runner/Assets.xcassets


## Upgrade
rm -rf android linux web windows macos ios
rm pubspec.lock
flutter upgrade --force
flutter clean 
flutter create .
flutter pub upgrade --major-versions --tighten
flutter pub outdated
sleep 1

cp -R backup/ios/ ios/
cp -R backup/android/ android/

rm -r backup/

git diff