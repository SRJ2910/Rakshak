import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rakshak/custom_widgets/constants.dart';

class CustomIcon extends StatefulWidget {

  IconData icon;

  CustomIcon({Key? key, 
    required this.icon,
  }) : super(key: key);

  @override
  State<CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            color: kMarronColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(widget.icon, size: 25, color: Colors.white,
          ))
      );
  }
}