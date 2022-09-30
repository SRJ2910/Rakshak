import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rakshak/custom_widgets/constants.dart';

class CustomIcon extends StatefulWidget {
  String iconPath;
  String iconLabel;

  CustomIcon({Key? key, required this.iconLabel, required this.iconPath})
      : super(key: key);

  @override
  State<CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kMarronColor, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          widget.iconPath,
          color: Colors.white,
          semanticsLabel: widget.iconLabel,
          height: 30,
          width: 30,
        ),
      ),
    );
  }
}
