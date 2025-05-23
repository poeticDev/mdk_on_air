import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdk_on_air/componant/splash_screen.dart';
import 'package:mdk_on_air/const/color.dart';
import 'package:mdk_on_air/const/studio_states.dart';
import 'package:mdk_on_air/model/studio_state_model.dart';
import 'package:mdk_on_air/util/initializer.dart';
import 'package:mdk_on_air/util/state_manager.dart';

class DefaultLayout extends ConsumerWidget {
  const DefaultLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StudioState currentState = ref.watch(studioStateProvider);

    return Scaffold(
      backgroundColor: currentState.bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Center(
            child: Text(
              currentState.text,
              style: currentState.fontStyle.copyWith(
                color: currentState.fontColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
