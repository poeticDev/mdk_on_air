import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mdk_on_air/const/studio_states.dart';
import 'package:mdk_on_air/const/style.dart';
import 'package:mdk_on_air/model/studio_state_model.dart';


/// 초기 상태 정의
final studioStateProvider = StateProvider<StudioState>((ref) {
  return STATE_READY;
});
