#!/bin/zsh
find . -name "pubspec.yaml" -not -path "./.flutter.git/*" -execdir flutter pub get \;
find . -name "pubspec.yaml" -not -path "./.flutter.git/*" -execdir dart run build_runner build -d \;

