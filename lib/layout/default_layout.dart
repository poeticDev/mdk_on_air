import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdk_on_air/componant/splash_screen.dart';
import 'package:mdk_on_air/const/color.dart';
import 'package:mdk_on_air/const/studio_states.dart';
import 'package:mdk_on_air/const/style.dart';
import 'package:mdk_on_air/model/studio_state_model.dart';
import 'package:mdk_on_air/util/initializer.dart';
import 'package:mdk_on_air/util/state_manager.dart';

class DefaultLayout extends ConsumerWidget {
  const DefaultLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // StudioState currentState = STATE_CHECK;
    StudioState currentState = ref.watch(studioStateProvider);

    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;

    final sensorBoxWidth = mWidth * 0.28;
    final sensorFontSize = mHeight * 0.17;

    return Scaffold(
      backgroundColor: currentState.bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(maxWidth: mWidth, maxHeight: mHeight),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    currentState.text,
                    style: currentState.fontStyle.copyWith(
                      color: currentState.fontColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              VerticalDivider(
                thickness: 2.0,
                color: currentState.fontColor.withAlpha(80),
              ),
              SizedBox(
                width: sensorBoxWidth,
                height: mHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          '현재 온도',
                          style: SENSOR_FONT_STYLE.copyWith(
                            fontSize: sensorFontSize * 0.4,
                            color: currentState.fontColor,
                          ),
                        ),
                        Text(
                          '24.7℃',
                          style: SENSOR_FONT_STYLE.copyWith(
                            fontSize: sensorFontSize,
                            color: currentState.fontColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '현재 습도',
                          style: SENSOR_FONT_STYLE.copyWith(
                            fontSize: sensorFontSize * 0.4,
                            color: currentState.fontColor,
                          ),
                        ),
                        Text(
                          '46.1%',
                          style: SENSOR_FONT_STYLE.copyWith(
                            fontSize: sensorFontSize,
                            color: currentState.fontColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
