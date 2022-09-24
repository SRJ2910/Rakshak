import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rakshak/custom_widgets/constants.dart';

class CustomListTile extends StatefulWidget {

  final String title;
  final String subtitle;
  final IconData icon;

  // ignore: use_key_in_widget_constructors
  const CustomListTile({
      required this.title,
      required this.subtitle,
      required this.icon,
    });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: SizedBox(
          height: 50,
          width: 50,
          child: Icon(widget.icon, color: kMarronColor,),
        ),
        title: Text(widget.title),
        subtitle: Text(widget.subtitle),
      );
  }
}