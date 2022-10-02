import 'package:flutter/material.dart';
import 'package:rakshak/custom_widgets/constants.dart';
import 'package:rakshak/pages/home_page.dart';
import 'package:rakshak/pages/login.dart';
import 'package:rakshak/pages/main_page.dart';
import 'package:rakshak/pages/signin.dart';
import 'package:rakshak/services/api_v1.dart';
import 'package:rakshak/utils/const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ///
  @override
  void initState() {
    super.initState();
    authStatus();
  }

  Future<void> authStatus() async {
    final cj = await const ApiV1Service().initCookiesManager();
    final cookies = await cj.loadForRequest(Uri.parse(constant.apiUrl));
    final isAuthenticated = cookies.isNotEmpty;
    print(cookies.toList());
    Future.delayed(
      const Duration(milliseconds: 3000),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                isAuthenticated ? HomePage() : LoginPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: Center(
        child: SizedBox.expand(
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                    Color(0xffBA324F),
                    Color(0xffD62839),
                  ], // Gradient from https://learnui.design/tools/gradient-generator.html
                  tileMode: TileMode.mirror,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/logo.png'),
                  const Text(
                    'Rakshak',
                    style: TextStyle(
                      fontSize: 54,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFFFC4C4),
                    ),
                  ),
                  const Text(
                    'We protect you!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFFFC4C4),
                    ),
                  ),
                ],
              )
              ),
        ),
      ),
    );
  }
}
