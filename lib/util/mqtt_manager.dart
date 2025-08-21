import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdk_on_air/const/studio_states.dart';
import 'package:mdk_on_air/util/global_data.dart';
import 'package:mdk_on_air/util/power_controller.dart';
import 'package:mdk_on_air/util/state_manager.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttManager {
  final String broker;
  final String clientId;
  int port;
  late MqttServerClient _client;
  final bool isSecure;
  final String userName;
  final String password;

  WidgetRef? ref;
  Timer? _retryTimer;

  MqttManager({
    required this.broker,
    required this.clientId,
    this.port = 1883,
    this.isSecure = false,
    this.userName = 'mdk',
    this.password = '12344321',
  }) {
    _client = MqttServerClient(broker, clientId);
    _configureClient();
  }

  final List<String> SUBSCRIBING_TOPICS = [
    'node-mdk/+/${globalData.deviceName}',
    'node-mdk/states',
  ];


  void _configureClient() {
    if (isSecure && port == 1883) {
      port = 8883;
      _client.securityContext = SecurityContext.defaultContext;
    }
    _client.port = port;
    _client.keepAlivePeriod = 20;
    _client.connectTimeoutPeriod = 2000;
    _client.logging(on: false);
    _client.onConnected = _onConnected;
    _client.onDisconnected = _onDisconnected;
    _client.onSubscribed = _onSubscribed;
    _client.onSubscribeFail = _onSubscribeFail;
    _client.pongCallback = _pongCallback;
    _client.pingCallback = _pingCallback;
    _client.setProtocolV311();
  }

  Future<bool> connect() async {
    final connMessage = MqttConnectMessage()
        .withClientIdentifier(clientId)
        .authenticateAs(userName, password)
        .startClean()
        .withWillQos(MqttQos.atMostOnce);
    _client.connectionMessage = connMessage;

    try {
      await _client.connect().timeout(Duration(seconds: 10));
    } on Exception catch (e) {
      print('❌ 연결 실패: $e');
      _client.disconnect();
      return false;
    }

    return _client.connectionStatus?.state == MqttConnectionState.connected;
  }

  void disconnect() {
    print('🔌 MQTT 연결 종료');
    _client.disconnect();
  }

  void subscribe(String topic) {
    print('📡 구독 요청: $topic');
    _client.subscribe(topic, MqttQos.atMostOnce);
  }

  void publish(String topic, String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    print('📤 메시지 발행: $topic → "$message"');
    _client.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
  }

  void listen() {
    _client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final payload = utf8.decode(recMess.payload.message);
      final topic = c[0].topic;
      print('📩 수신된 메시지: $topic → "$payload"');
      _handleMessage(topic, payload);
    });
  }

  Future<void> connectAndHandle(WidgetRef ref) async {
    this.ref = ref;
    final success = await connect();
    if (success) {
      _retryTimer?.cancel();
      _retryTimer = null;
      for (var topic in SUBSCRIBING_TOPICS) {
        subscribe(topic);
      }
      listen();
    } else {
      retryConnect(ref);
    }
  }

  void retryConnect(WidgetRef ref) {
    print('10초 후 MQTT 재연결을 시도합니다.');
    if (_retryTimer != null) return;
    _retryTimer = Timer(Duration(seconds: 10), () async {
      _retryTimer = null;
      print('🔁 MQTT 재연결 시도 중...');
      await connectAndHandle(ref);
    });
  }

  void _handleMessage(String topic, String message) {
    if (ref == null) return;
    final r = ref!;
    try {
      if (topic.split('/').last == globalData.deviceName) {
        final parsedInt = int.tryParse(message) ?? 0;
        if (parsedInt == 4) PowerController.shutdown();
        r.read(studioStateProvider.notifier).state =
            STATE_LIST[parsedInt] ?? STATE_LIST[0];
      } else if (topic == 'node-mdk/states') {
        final parsed = jsonDecode(message);
        final sensor = parsed[globalData.sensorName];
        if (sensor is Map<String, dynamic>) {
          final tempRaw = double.tryParse(sensor['temperature']?.toString() ?? '');
          final humRaw = double.tryParse(sensor['humidity']?.toString() ?? '');
          r.read(temperatureProvider.notifier).state =
          tempRaw != null ? (tempRaw * 10).round() / 10 : -999.0;
          r.read(humidityProvider.notifier).state =
          humRaw != null ? (humRaw * 10).round() / 10 : -999.0;
        } else {
          print('❌ sensor 필드 파싱 실패');
        }
      }
    } catch (e) {
      print('❌ 메시지 핸들링 오류: $e');
    }
  }

  void _onConnected() => print('✅ MQTT 서버 연결 성공');
  void _onDisconnected() {
    print('❌ MQTT 서버 연결 해제됨');
    if (ref != null) retryConnect(ref!);
  }
  void _onSubscribed(String topic) => print('✅ 구독 성공: $topic');
  void _onSubscribeFail(String topic) => print('❌ 구독 실패: $topic');
  void _pongCallback() => print('🔄 Pong 응답 수신');
  void _pingCallback() => print('🔄 Ping 요청 전송');
}

MqttManager? mqttManager;
