import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdk_on_air/const/style.dart';

class SensorText extends ConsumerWidget {
  final StateProvider<double?> provider;
  final String? unitString;
  final double fontSize;
  final Color fontColor;

  const SensorText({
    required this.provider,
    required this.fontSize,
    required this.fontColor,
    this.unitString,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double? sensorValue = ref.watch(provider);

    return Text(
      '${formatSensorValue(sensorValue)}${unitString ?? ''}',
      style: SENSOR_FONT_STYLE.copyWith(
        fontSize: fontSize,
        color: fontColor,
      ),
    );
  }

  String formatSensorValue(double? value) {
    if (value == null || value.isNaN || value == -999.0) {
      return '-.-';
    }
    return value.toStringAsFixed(1);
  }
}
