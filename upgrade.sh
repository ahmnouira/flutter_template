#!/bin/sh

rm -rf android linux web windows macos ios
rm pubspec.lock
flutter clean 
flutter create .
flutter pub upgrade --major-versions --tighten
flutter pub outdated