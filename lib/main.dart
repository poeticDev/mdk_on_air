import 'package:flutter/material.dart';
import 'package:mdk_on_air/layout/default_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Paperlogy',
      ),
      debugShowCheckedModeBanner: false,
      home: DefaultLayout(),
    );
  }
}
