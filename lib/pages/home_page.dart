import 'package:flutter/material.dart';
import 'package:rakshak/custom_widgets/cutom_bottom_nav_bar.dart';
import 'package:rakshak/pages/guardian_mode.dart';
import 'package:rakshak/pages/guardians.dart';
import 'package:rakshak/pages/sos_history.dart';
// import 'globals.dart' as globals;

import 'main_page.dart';

final index = ValueNotifier<int>(0);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  // static int index = 0;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    Guardians(),
    SOShistory(),
    GuardianMode(),
  ];

  @override
  Widget build(BuildContext context) {
    // print(HomePage.index);
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: index,
        builder: (BuildContext context, dynamic value, Widget? child) {
          return _widgetOptions.elementAt(value);
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
