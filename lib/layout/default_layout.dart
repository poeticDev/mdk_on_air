import 'package:animated_gradient_box/animated_gradient_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdk_on_air/componant/sensor_column.dart';
import 'package:mdk_on_air/const/studio_states.dart';
import 'package:mdk_on_air/const/style.dart';
import 'package:mdk_on_air/model/studio_state_model.dart';
import 'package:mdk_on_air/util/state_manager.dart';

class DefaultLayout extends ConsumerWidget {
  const DefaultLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // StudioState currentState = STATE_GOOD;
    StudioState currentState = ref.watch(studioStateProvider);
    List<Color> borderGradientColors = [Colors.transparent];

    if (currentState == STATE_CHECK) {
      borderGradientColors = [
        Color(0xFF4FC3F7), // Sky Blue
        Color(0xFF2979FF), // Strong Blue
        Color(0xFF7C4DFF), // Purple Accent
        Color(0xFF00B0FF), // Azure
      ];
    }

    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;

    final sensorBoxWidth = mWidth * 0.28;
    final sensorFontSize = mHeight * 0.17;

    return Scaffold(
      backgroundColor: currentState.bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GradientBox(
          colors: borderGradientColors,
          animationDuration: Duration(seconds: 3),
          borderWidth: 16,
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
                          SensorText(
                            provider: temperatureProvider,
                            unitString: '℃',
                            fontSize: sensorFontSize,
                            fontColor: currentState.fontColor,
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
                          SensorText(
                            provider: humidityProvider,
                            unitString: '%',
                            fontSize: sensorFontSize,
                            fontColor: currentState.fontColor,
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
      ),
    );
  }
}
