import 'package:flutter/material.dart';
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
      const Duration(milliseconds: 6000),
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
    return const Scaffold(
      primary: false,
      // appBar: AppBar(
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarIconBrightness: Brightness.dark,
      //     statusBarColor: Colors.blue,
      //   ),
      //   backgroundColor: Colors.blue,
      // ),
      // backgroundColor: Colors.blue,
      body: Center(
        // child: SvgPicture.asset("assets/icon/splashlogo.svg"),
        child: Text("splash screen"),
      ),
    );
  }
}
