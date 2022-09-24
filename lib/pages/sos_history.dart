import 'package:flutter/material.dart';
import '../custom_widgets/cutom_list_tile.dart';

class SOShistory extends StatefulWidget {
  const SOShistory({Key? key}) : super(key: key);

  @override
  State<SOShistory> createState() => _SOShistoryState();
}

class _SOShistoryState extends State<SOShistory> {
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
              'SOS History',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 11,
              itemBuilder: (context, index) {
              return const CustomListTile(
                  title: "SOS",
                  subtitle: "May 20, 2022 at 10:33 PM",
                  icon: Icons.people);
            }),
          )
        ],
      ),
    ));
  }
}
