import 'dart:typed_data';

import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'drift.dart';

class GlobalData {
  /// Basic Info
  /// 0. 아이디
  int? id;

  /// 1. 강의실 정보
  late String deviceId;
  late String? wifiName;

  /// 2. 서버
  late String serverIp;
  late int serverMqttPort;
  late String serverMqttId;
  late String serverMqttPassword;

  /// 데이터베이스에서 GlobalData를 업데이트하는 메서드
  /// AppDatabase가 등록되어 있지 않으면 예외를 발생시킨 후, AppDatabase를 열고 다시 시도
  Future<void> updateGlobalData() async {
    try {
      // AppDatabase가 등록되어 있지 않으면 예외 발생
      if (!GetIt.I.isRegistered<AppDatabase>()) {
        throw Exception("AppDatabase가 연결되지 않았습니다.");
      }

      // GetIt에서 데이터베이스 인스턴스 가져오기
      final db = GetIt.I<AppDatabase>();

      // 데이터베이스에서 정보 가져오기
      print("updateGlobalData() 시작");
      await Future.delayed(Duration(milliseconds: 500)); // 비동기 흐름 확인용
      await _updateGlobalDataFromDB(db);
      await Future.delayed(Duration(milliseconds: 500)); // 비동기 흐름 확인용
      print("updateGlobalData() 완료");
    } catch (e) {
      print("Error: $e");

      // 에러 발생 시 데이터베이스 오픈 및 재시도
      try {
        print("AppDatabase를 열고 데이터 업데이트를 재시도합니다.");
        AppDatabase.openDB();
        print("AppDatabase 열기 완료. 재시도 시작.");

        // 재등록 후 다시 데이터베이스 인스턴스 가져오기
        final db = GetIt.I<AppDatabase>();
        await _updateGlobalDataFromDB(db);
      } catch (retryError) {
        print("Retry failed: $retryError");
      }
    }
  }

  /// 데이터베이스에서 GlobalData를 업데이트하는 실제 로직
  /// BasicInfo, Button, Page, ButtonWithPage 데이터를 불러와서 클래스 변수에 할당
  Future<void> _updateGlobalDataFromDB(AppDatabase db) async {
    try {
      final BasicInfoData? basicInfoData = await db.getLatestBasicInfo();

      if (basicInfoData != null) {
        print('기본 정보 할당 중');
        id = basicInfoData.id;
        deviceId = basicInfoData.deviceId;
        wifiName = basicInfoData.wifiName;

        serverIp = basicInfoData.serverIp;
        serverMqttPort = basicInfoData.serverMqttPort;
        serverMqttId = basicInfoData.serverMqttId;
        serverMqttPassword = basicInfoData.serverMqttPassword;
      } else {

      }
    } catch (e, stacktrace) {
      print('Error in _updateGlobalDataFromDB: $e');
      print(stacktrace);
    }
  }

  /// 앱 첫 실행 시 기본 데이터를 데이터베이스에 초기화하는 메서드
  /// 기본 버튼, 페이지, 장비 등의 정보를 데이터베이스에 입력
  Future<void> initializeDB() async {
    if (!GetIt.I.isRegistered<AppDatabase>()) {
      AppDatabase.openDB();
    }

    final db = GetIt.I<AppDatabase>();

    // 로고 이미지 파일을 로드하여 DB에 저장
    final ByteData bytes = await rootBundle.load('asset/img/logo.gif');
    final Uint8List imageList = bytes.buffer.asUint8List();

    // 기본 정보 생성
    await db.createBasicInfo(
      BasicInfoCompanion(
        deviceId: const Value('ghu-studio-onair3'),
        wifiName: const Value('mdk'),
        serverIp: const Value('192.168.11.12'),
      ),
    );
    // 등록한 DB를 업데이트
    await updateGlobalData();
  }
}

// GlobalData 클래스의 인스턴스를 싱글톤처럼 사용하는 전역 변수
final GlobalData globalData = GlobalData();
