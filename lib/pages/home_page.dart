import 'package:flutter/material.dart';
import 'package:rakshak/custom_widgets/cutom_bottom_nav_bar.dart';
import 'package:rakshak/pages/guardian_mode.dart';
import 'package:rakshak/pages/guardians.dart';
import 'package:rakshak/pages/sos_history.dart';
import 'package:rakshak/pages/where_to.dart';
import 'package:rakshak/services/sos_message_user.dart';
import 'package:rakshak/utils/global.dart';
import 'package:rakshak/utils/locator.dart';
import 'package:shake/shake.dart';
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
    WhereTo(),
  ];

  @override
  Widget build(BuildContext context) {
    /// shake detector
    ShakeDetector detector = ShakeDetector.autoStart(
        minimumShakeCount: 5,
        onPhoneShake: () {
          SosMessageService().sendSos().then((value) =>
              locator<GlobalServices>()
                  .successSnackBar("SOS sent successfully ✔"));
          print("Detector lga diya h :)");
        });

    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: index,
        builder: (BuildContext context, dynamic value, Widget? child) {
          detector;
          return _widgetOptions.elementAt(value);
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
