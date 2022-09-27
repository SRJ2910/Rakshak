import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:rakshak/custom_widgets/constants.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool statusSafeShake = false;
  bool statusLocation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  'Settings',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 1,
                  width: 1,
                ),
                Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Yashesh Bhavsar',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      '+91 87806 54420',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 1,
                  width: 1,
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                const Icon(Icons.key),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text('Change SOS pin',
                        style: TextStyle(fontSize: 18)),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      'SOS pin is required to switch OFF\nthe SOS alert',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Text('Notifications', style: TextStyle(fontSize: 18)),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Icon(Icons.mobile_friendly_sharp),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Safe Shake', style: TextStyle(fontSize: 18)),
                      Text(
                        'Switch ON to listen for device shake',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                FlutterSwitch(
                  width: 30.0,
                  height: 15.0,
                  valueFontSize: 12.0,
                  toggleSize: 6.0,
                  value: statusSafeShake,
                  onToggle: (val) {
                    setState(() {
                      statusSafeShake = val;
                    });
                  },
                  activeColor: kMarronColor,
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Icon(Icons.location_on_outlined),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Location', style: TextStyle(fontSize: 18)),
                      Text(
                        'Switch ON to share the location',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                FlutterSwitch(
                  width: 30.0,
                  height: 15.0,
                  valueFontSize: 12.0,
                  toggleSize: 6.0,
                  value: statusLocation,
                  onToggle: (val) {
                    setState(() {
                      statusLocation = val;
                    });
                  },
                  activeColor: kMarronColor,
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Icon(Icons.message),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Customized Message', style: TextStyle(fontSize: 18)),
                    Text(
                      'Customize your SOS',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Text('Application', style: TextStyle(fontSize: 18)),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: const [
                Icon(Icons.info),
                SizedBox(
                  width: 16,
                ),
                Text('About Us', style: TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: const [
                Icon(Icons.share),
                SizedBox(
                  width: 16,
                ),
                Text('Share', style: TextStyle(fontSize: 18)),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
