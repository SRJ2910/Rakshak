import 'package:flutter/material.dart';
import 'package:rakshak/custom_widgets/cutom_bottom_nav_bar.dart';
import 'package:rakshak/pages/guardian_mode.dart';
import 'package:rakshak/pages/guardians.dart';
import 'package:rakshak/pages/sos_history.dart';

import 'main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
    return Scaffold(
      body: _widgetOptions.elementAt(0),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}