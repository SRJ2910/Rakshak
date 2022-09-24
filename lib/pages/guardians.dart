import 'package:flutter/material.dart';
import '../custom_widgets/cutom_list_tile.dart';

class Guardians extends StatefulWidget {
  const Guardians({Key? key}) : super(key: key);

  @override
  State<Guardians> createState() => _GuardiansState();
}

class _GuardiansState extends State<Guardians> {
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
              'My Guardians',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 11,
              itemBuilder: (context, index) {
              return const CustomListTile(
                  title: "Yashesh Bhavsar",
                  subtitle: "+91 8780654420",
                  icon: Icons.people);
            }),
          )
        ],
      ),
    ));
  }
}
