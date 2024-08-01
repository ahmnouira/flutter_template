#!/bin/sh

rm -rf android linux web windows macos ios
rm pubspec.lock
flutter upgrade --force
flutter clean 
flutter create .
flutter pub upgrade --major-versions --tighten
flutter pub outdated
sleep 1
git diff