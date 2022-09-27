import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

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
                  child: const Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Colors.black,
                  ),
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                const Text(
                  'Settings',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 1,
                  width: 1,
                ),
                Column(
                  children: [
                    const Text('Yashesh Bhavsar'),
                    const Text('+91 87806 54420'),
                  ],
                ),
                const SizedBox(
                  height: 1,
                  width: 1,
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.key),
                Column(
                  children: [
                    const Text('Change SOS pin'),
                    const Text(
                        'SOS pin is required to switch OFF\nthe SOS alert'),
                  ],
                )
              ],
            ),
            Row(
              children: [
                const Text('Notifications'),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Row(
                  children: [
                    const Icon(Icons.mobile_friendly_sharp),
                    Column(
                      children: [
                        const Text('Safe Shake'),
                        const Text('Switch ON to listen for device shake'),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined),
                    Column(
                      children: [
                        const Text('Location'),
                        const Text('Switch ON to share the location'),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.message),
                Column(
                  children: [
                    const Text('Customized Message'),
                    const Text('Customize your SOS'),
                  ],
                )
              ],
            ),
            Row(
              children: [
                const Text('Application'),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Icon(Icons.info),
                const Text('About Us'),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.share),
                const Text('Share'),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
