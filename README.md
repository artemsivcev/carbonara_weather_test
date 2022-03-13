# carbonara_weather_test  ![Generic badge](https://img.shields.io/badge/flutter-blue?logo=flutter&style=flat)  ![Generic badge](https://img.shields.io/badge/platform-android-8bd08d.svg)  ![Generic badge](https://img.shields.io/badge/platform-iOS-cacaca.svg)

This is a test app for interview.
## Preview

![enter image description here](https://s7.gifyu.com/images/preview_app.gif)

## PreBuild

**run cleanAndRebuild.sh**

## What it can

- We have [api](https://www.metaweather.com/api/) integration
- Custom user city search
- Current weather info
- List with weather info for other days
- C°/F° change
- Different mobile orientation support
- User prefs storage

## How it works

Files generations.  
Generation used to create json's for models and in mobX.

After cloning the project and getting packages use the command bellow:  
flutter packages pub run build_runner build

In future, you maybe will be need to resolve some conflicts with generated  
.g.dart files. You can delete they manually or by command:  
flutter packages pub run build_runner build --delete-conflicting-outputs

For all this needs we have cleanAndRebuild.sh in project root, just run it.
  
-----------  

MobX  
In the ptoject using several MobX plugins: mobx, flutter_mobx, mobx_codegen.  
See https://pub.dev/documentation/mobx/latest/.
  
-----------  

Json generation  
For json generation: https://pub.dev/documentation/json_annotation/latest/
  
-----------  

Logging  
For loggin used Logger package:  
https://pub.dev/documentation/logger/latest/