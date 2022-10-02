import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../custom_widgets/constants.dart';

class WhereTo extends StatefulWidget {
  const WhereTo({Key? key}) : super(key: key);

  @override
  State<WhereTo> createState() => _WhereToState();
}

class _WhereToState extends State<WhereTo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 24, top: 8, bottom: 8),
            child: Text(
              'Where to',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(flex: 1, child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {},
                  cursorColor: kMarronColor,
                  decoration: const InputDecoration(
                    focusColor: kMarronColor,
                    hintText: "Start",
                    icon: Icon(
                      Icons.circle_outlined,
                      color: Colors.grey
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  onChanged: (value) {},
                  cursorColor: kMarronColor,
                  decoration: const InputDecoration(
                    focusColor: kMarronColor,
                    hintText: "Destination",
                    icon: Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  onChanged: (value) {},
                  cursorColor: kMarronColor,
                  decoration: const InputDecoration(
                    focusColor: kMarronColor,
                    hintText: "Expected time to reach destination",
                    icon: Icon(
                      Icons.alarm,
                      color: Colors.grey
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 5,
                        height: 5,
                      ),
                      TextButton(
                        onPressed: () async {
                          
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
                                  padding: EdgeInsets.all(14.0),
                                  child: Text(
                                    'SEND',
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
                  ),
              ],
            ),
          ),
          Expanded(flex: 2, child: Container()),
        ],
      ),
    ));
  }
}
