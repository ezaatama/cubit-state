import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_logic.dart';
import 'package:flutter_cubit/screens/bottom_navpages/main_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_cubit/service/data_service.dart';
import 'cubit/app_cubits.dart';
import 'screens/detail_page.dart';
import 'screens/welcome_screen.dart';

///Use Device Preview
  // void main() {
  //   runApp(
  //     DevicePreview(
  //       enabled: !kReleaseMode,
  //       builder: (context) => MyApp()));
  // }

///Use Preview Default
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(create: (context) => AppCubits(
        data: DataService()
      ),
        child: AppCubitLogic()
      )
    );
  }
}
