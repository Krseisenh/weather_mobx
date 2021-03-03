#!/bin/sh
cd $(dirname $0)/..

flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs