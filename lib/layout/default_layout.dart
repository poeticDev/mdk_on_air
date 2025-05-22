import 'package:flutter/material.dart';
import 'package:mdk_on_air/const/color.dart';
import 'package:mdk_on_air/const/studio_states.dart';
import 'package:mdk_on_air/model/studio_state_model.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({super.key});

  @override
  Widget build(BuildContext context) {
    StudioState currentState = STATE_CHECK;

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
