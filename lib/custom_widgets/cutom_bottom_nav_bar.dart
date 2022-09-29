import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rakshak/pages/home_page.dart';

import 'constants.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Container(
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 5, color: Colors.black12, spreadRadius: 1)
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.all(12.0),
                child: IconButton(
                  icon: SvgPicture.asset('assets/icons8-home.svg',
                      color: kMarronColor, semanticsLabel: 'Setting'),
                  onPressed: () {
                    index.value = 0;
                  },
                )),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: IconButton(
                icon: SvgPicture.asset('assets/Artboard 100133.svg',
                    color: kMarronColor, semanticsLabel: 'Setting'),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.black26,
                  ],
                ),
                borderRadius: BorderRadius.circular(100)),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: kMarronColor,
                    borderRadius: BorderRadius.circular(100)),
                child: IconButton(
                  icon: SvgPicture.asset('assets/Artboard 100135.svg',
                      color: Colors.white,
                      height: 55,
                      width: 55,
                      semanticsLabel: 'Setting'),
                  onPressed: () {},
                ),
              ),
            )),
      )
    ]);
  }
}
