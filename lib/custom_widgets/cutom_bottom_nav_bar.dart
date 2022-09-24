import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
        Container(
          decoration: BoxDecoration(color: Colors.white,
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.shade300)]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.access_alarm_rounded),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.access_alarm_rounded),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 254, 83, 83),
              borderRadius: BorderRadius.circular(1000)
            ),
            child: Icon(Icons.circle_notifications, size: 75,)
          ),
        )
      ]),
    );
  }
}
