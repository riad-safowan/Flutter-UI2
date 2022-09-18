import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:ui_design/screens/home/bloc/home_bloc.dart';
import 'screens/home/HomeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'K2D'),
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => HomeBloc(),
          child: const HomeScreen(),
        ));
  }
}
