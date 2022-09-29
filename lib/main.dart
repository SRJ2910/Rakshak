import 'package:flutter/material.dart';
import 'package:rakshak/pages/login.dart';
import 'package:rakshak/pages/splashscreen.dart';
import 'package:rakshak/utils/global.dart';
import 'package:rakshak/utils/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  locator.registerLazySingleton(() => GlobalServices());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rakshak",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: locator<GlobalServices>().navigatorKey,
      home: const SplashScreen(),
    );
  }
}
