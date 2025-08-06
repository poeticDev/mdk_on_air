# mdk_on_air

Wide on-air display

# Release

## 1.0.0
- **빌드명** : Pilot
- **설치 장소** : 광주보건대 스튜디오
- **주요 기능** :
    - MQTT
      - 0~n : 스튜디오 상태 표시
      - sensor : 온습도 센서 데이터 표시

## 1.0.1
- **빌드명** : Pilot
- **설치 장소** : 광주보건대 스튜디오
- **주요 기능** :
    - MQTT
        - 0~n : 스튜디오 상태 표시
        - sensor : 온습도 센서 데이터 표시
        - 미연결시 30초마다 재연결 시도

# Customizing Step
1. mqtt_manager.dart
   - DEVICE_NAME 변경
   - stateHandler 내부 sensor 번호 변경
2. globalData deviceId 확인 -> mqtt 구분자가 됨


# Tox4 android setting
- adb connect
adb root
adb remount
adb push myapp.apk /system/priv-app/MyApp/MyApp.apk
adb shell chmod 755 /system/priv-app/MyApp
adb shell chmod 644 /system/priv-app/MyApp/MyApp.apk
adb reboot
