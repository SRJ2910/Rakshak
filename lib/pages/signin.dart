import 'package:flutter/material.dart';
import 'package:rakshak/custom_widgets/constants.dart';
import 'package:rakshak/custom_widgets/text_field_shadow.dart';
import 'package:rakshak/pages/home_page.dart';
import 'package:rakshak/pages/login.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const TextFieldShadow(
                      labelText: 'FULL NAME',
                      icon: Icons.person,
                      textInputType: TextInputType.name,
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 8,
                    ),
                    const TextFieldShadow(
                      labelText: 'EMAIL ID',
                      icon: Icons.person,
                      textInputType: TextInputType.emailAddress,
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 8,
                    ),
                    const TextFieldShadow(
                      labelText: 'PHONE NUMBER',
                      icon: Icons.person,
                      textInputType: TextInputType.phone,
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 8,
                    ),
                    const TextFieldShadow(
                      labelText: 'ADDRESS',
                      icon: Icons.person,
                      textInputType: TextInputType.streetAddress,
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 8,
                    ),
                    const TextFieldShadow(
                      labelText: 'ADHAR CARD',
                      icon: Icons.person,
                      textInputType: TextInputType.number,
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 8,
                    ),
                    const TextFieldShadow(
                      labelText: 'PASSWORD',
                      icon: Icons.person,
                      textInputType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 8,
                    ),
                    const TextFieldShadow(
                      labelText: 'CONFIRM PASSWORD',
                      icon: Icons.person,
                      textInputType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45, bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 5,
                      height: 5,
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                      child: Container(
                      alignment: Alignment.centerRight,
                      width: 125,
                        decoration: BoxDecoration(
                            color: kMarronColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(color: kMarronColor, offset: Offset(2.0, 2.0))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_back, color: Colors.white),
                          ],
                        )),
                    ),
                  ],
                )
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? '),
                  TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          color: kMarronColor,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
