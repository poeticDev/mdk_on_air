import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdk_on_air/const/color.dart';
import 'package:mdk_on_air/layout/default_layout.dart';
import 'package:mdk_on_air/util/initializer.dart';

class SplashScreen extends ConsumerStatefulWidget {
  SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashState();
}

class _SplashState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: AppInitializer.initialize(ref),
          builder: (context, snapshot) {
            if (snapshot.data == '앱 초기화 완료') {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => DefaultLayout()));
            }

            return LayoutBuilder(
              builder: (context, constraints) {
                final mWidth = constraints.maxWidth;
                final mHeight = constraints.maxHeight;
                final circleSize = (mWidth < mHeight ? mWidth : mHeight) / 2;
                final double fontSize = circleSize * 0.2 > 12 ? circleSize : 12;
                final padding = mHeight - circleSize - fontSize;

                return Center(
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
                                'asset/img/logo.png',
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
