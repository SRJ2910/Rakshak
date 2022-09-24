import 'package:flutter/material.dart';
import '../custom_widgets/cutom_list_tile.dart';

class GuardianMode extends StatefulWidget {
  const GuardianMode({Key? key}) : super(key: key);

  @override
  State<GuardianMode> createState() => _GuardianModeState();
}

class _GuardianModeState extends State<GuardianMode> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 24, top: 8, bottom: 8),
            child: Text(
              'My GuardianMode',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 11,
              itemBuilder: (context, index) {
              return const CustomListTile(
                  title: "Yashesh Bhavsar",
                  subtitle: "May 20, 2022 at 10:33 PM",
                  icon: Icons.people);
            }),
          )
        ],
      ),
    ));
  }
}
