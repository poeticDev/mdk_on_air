import 'package:flutter/material.dart';
import 'package:mdk_on_air/const/color.dart';
import 'package:mdk_on_air/model/studio_state_model.dart';

final StudioState STATE_ON_AIR = StudioState(
  text: '촬영 중',
  bgColor: BG_RED,
  fontColor: WHITE_TEXT_COLOR,
);

final StudioState STATE_READY = StudioState(
  text: '대기 중',
  bgColor: BG_GREEN,
  fontColor: BLACK_TEXT_COLOR,
);

final StudioState STATE_CHECK = StudioState(
  text: '자동 점검 중',
  bgColor: BG_BLUE,
  fontColor: WHITE_TEXT_COLOR,
);