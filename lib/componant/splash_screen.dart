import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:mdk_on_air/componant/configuration_dialog.dart';
import 'package:mdk_on_air/const/color.dart';
import 'package:mdk_on_air/layout/default_layout.dart';
import 'package:mdk_on_air/util/drift.dart';
import 'package:mdk_on_air/util/global_data.dart';
import 'package:mdk_on_air/util/initializer.dart';

class SplashScreen extends ConsumerStatefulWidget {
  SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashState();
}

class _SplashState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    if (AppInitializer.getInitializedStatus()) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => DefaultLayout()));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: AppInitializer.initialize(ref),
          initialData: '',
          builder: (context, snapshot) {
            if (snapshot.data == '앱 초기화 완료') {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DefaultLayout()),
                );
              });
            }

            if (snapshot.data == 'Database 초기화 중...') {
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                final result = await showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => ConfigurationDialog(
                    onSave: (info) async {
                      final db = GetIt.I<AppDatabase>();

                      await db.createBasicInfo(info);
                      await globalData.updateGlobalData(); // 다시 globalData 갱신
                    },
                  ),
                );

                if (mounted) {
                  // MQTT 초기화 후 이동
                  await AppInitializer.openMqttManager(ref);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const DefaultLayout()),
                  );
                }
              });
            }

            return LayoutBuilder(
              builder: (context, constraints) {
                final mWidth = constraints.maxWidth;
                final mHeight = constraints.maxHeight;
                final circleSize = (mWidth < mHeight ? mWidth : mHeight) / 2;
                final double fontSize = 12;
                final padding = 20.0;

                return SizedBox(
                  width: mWidth,
                  height: mHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: circleSize,
                        height: circleSize,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'asset/img/logo.gif',
                                width: circleSize * 0.7,
                                height: circleSize * 0.7,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              width: circleSize,
                              height: circleSize,
                              child: CircularProgressIndicator(
                                strokeWidth: 6,
                                color: SPLASH_COLOR,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: padding),
                      Text(
                        snapshot.data!,
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.w500,
                          color: BLACK_TEXT_COLOR,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
