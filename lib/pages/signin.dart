// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:rakshak/custom_widgets/constants.dart';
import 'package:rakshak/custom_widgets/text_field_shadow.dart';
import 'package:rakshak/model/signupinput.dart';
import 'package:rakshak/pages/home_page.dart';
import 'package:rakshak/pages/login.dart';
import 'package:rakshak/pages/main_page.dart';
import 'package:rakshak/services/auth.dart';
import 'package:rakshak/utils/global.dart';
import 'package:rakshak/utils/locator.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    AuthService auth = const AuthService();
    final SignUpInput _signUpInput = SignUpInput();

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFieldShadow(
                          labelText: 'FULL NAME',
                          icon: Icons.person,
                          textInputType: TextInputType.name,
                          onSave: (e) {
                            _signUpInput.name = e;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFieldShadow(
                          labelText: 'EMAIL ID',
                          icon: Icons.person,
                          textInputType: TextInputType.emailAddress,
                          onSave: (e) {
                            _signUpInput.email = e;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFieldShadow(
                          labelText: 'PHONE NUMBER',
                          icon: Icons.person,
                          textInputType: TextInputType.phone,
                          onSave: (e) {
                            _signUpInput.phoneNumber = e;
                          },
                          validator: (e) {
                            if (_signUpInput.phoneNumber!.length < 10) {
                              return "Phone number should be atleast 10-digit";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFieldShadow(
                          labelText: 'ADDRESS',
                          icon: Icons.person,
                          textInputType: TextInputType.streetAddress,
                          onSave: (e) {
                            _signUpInput.address = e;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFieldShadow(
                          labelText: 'GENDER',
                          icon: Icons.person,
                          textInputType: TextInputType.text,
                          onSave: (e) {
                            _signUpInput.gender = e;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFieldShadow(
                          labelText: 'AGE',
                          icon: Icons.timeline,
                          textInputType: TextInputType.number,
                          onSave: (e) {
                            _signUpInput.age = e;
                          },
                          validator: (e) {
                            int a = int.parse(_signUpInput.age!);
                            if (a < 1 || a > 80) {
                              return "Invalid age";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFieldShadow(
                          labelText: 'PASSWORD',
                          icon: Icons.person,
                          textInputType: TextInputType.visiblePassword,
                          obscureText: true,
                          onSave: (e) {
                            _signUpInput.password = e;
                          },
                          validator: (e) {
                            if (_signUpInput.password!.length < 8) {
                              return "Password atleat 8 characters";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFieldShadow(
                          labelText: 'CONFIRM PASSWORD',
                          icon: Icons.person,
                          textInputType: TextInputType.visiblePassword,
                          obscureText: true,
                          onSave: (e) {
                            _signUpInput.confirmPassword = e;
                          },
                          validator: (e) {
                            if (_signUpInput.confirmPassword!
                                    .compareTo(_signUpInput.password!) !=
                                0) {
                              return "Password doesn't match";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
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
                          onPressed: () async {
                            // print(_signUpInput.toString());
                            _formKey.currentState?.save();
                            final isValid =
                                _formKey.currentState?.validate() ?? false;

                            if (isValid) {
                              bool check =
                                  await auth.signUpRequest(_signUpInput);
                              if (check) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                  (route) => false,
                                );
                              }
                            } else {
                              locator<GlobalServices>()
                                  .errorSnackBar("Something went wrong");
                            }
                          },
                          child: Container(
                              alignment: Alignment.centerRight,
                              width: 125,
                              decoration: BoxDecoration(
                                  color: kMarronColor,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: kMarronColor,
                                        offset: Offset(2.0, 2.0))
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                  Icon(Icons.arrow_forward,
                                      color: Colors.white),
                                ],
                              )),
                        ),
                      ],
                    )),
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
                                builder: (context) => LoginPage()),
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
      ),
    );
  }
}
