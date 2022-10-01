import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:rakshak/custom_widgets/constants.dart';
import 'package:rakshak/model/sos_message.dart';
import 'package:rakshak/pages/login.dart';
import 'package:rakshak/services/auth.dart';
import 'package:rakshak/services/sos_message.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xen_popup_card/xen_card.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool statusSafeShake = false;
  bool statusLocation = false;
  String name = "";
  String phone = "";
  String id = "";

  @override
  void initState() {
    getCacheddata();
    getSOSmessagePref();
    super.initState();
  }

  getCacheddata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("User_Name")!;
      phone = prefs.getString("User_phone")!;
      id = prefs.getString("User_id")!;
    });
  }

  changeSOSmessagePref(String message) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("sosMessage", message);
  }

  getSOSmessagePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _globalMessage = prefs.getString("sosMessage")!;
    });
  }

  XenCardAppBar appBar = const XenCardAppBar(
    shadow: BoxShadow(color: Colors.transparent),
    child: Text(
      "Customize Message",
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
    ), // To remove shadow from appbar
  );
  String? _message = "Message A";
  String _editedMessage = "";
  String _globalMessage = "Message A"; // Final value
  bool _editEnabled = false;
  final SosMessage _sosMessage = SosMessage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
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
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                          ),
                          child: Image.asset('assets/dummy_dp.png'),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          name,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "+91-" + phone,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
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
                GestureDetector(
                  child: Row(
                    children: [
                      const Icon(Icons.logout),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Log Out', style: TextStyle(fontSize: 18)),
                        ],
                      )
                    ],
                  ),
                  onTap: () async {
                    await const AuthService().signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => LoginPage()),
                      (route) => false,
                    );
                  },
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
                TextButton(
                  onPressed: () => showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return XenPopupCard(
                              appBar: appBar,
                              body: Column(
                                children: [
                                  Text('Your current message:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Expanded(
                                      child: SingleChildScrollView(
                                          child: Text(
                                    _globalMessage,
                                    textAlign: TextAlign.center,
                                  ))),
                                  Row(
                                    children: [
                                      Radio<String>(
                                        value: "Message A",
                                        groupValue: _message,
                                        onChanged: (String? value) {
                                          setState(() {
                                            _editEnabled = false;
                                            _message = value;
                                            _globalMessage = 'Message A';
                                          });
                                        },
                                        activeColor: kMarronColor,
                                      ),
                                      const Flexible(
                                        child: Text(
                                          'Message A',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio<String>(
                                        value: "Message B",
                                        groupValue: _message,
                                        onChanged: (String? value) {
                                          setState(() {
                                            _editEnabled = false;
                                            _message = value;
                                            _globalMessage = 'Message B';
                                          });
                                        },
                                        activeColor: kMarronColor,
                                      ),
                                      const Flexible(
                                        child: Text(
                                          'Message B',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio<String>(
                                        value: "Message C",
                                        groupValue: _message,
                                        onChanged: (String? value) {
                                          setState(() {
                                            _editEnabled = false;
                                            _message = value;
                                            _globalMessage = 'Message C';
                                          });
                                        },
                                        activeColor: kMarronColor,
                                      ),
                                      const Flexible(
                                        child: Text(
                                          'Message C',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio<String>(
                                        value: "custom_message",
                                        groupValue: _message,
                                        onChanged: (String? value) {
                                          setState(() {
                                            _message = value;
                                            _editEnabled = true;
                                            _globalMessage = _editedMessage;
                                          });
                                        },
                                        activeColor: kMarronColor,
                                      ),
                                      Flexible(
                                        child: TextFormField(
                                          onChanged: (value) {
                                            if (_message == "custom_message") {
                                              setState(() {
                                                _editedMessage = value;
                                                _globalMessage = _editedMessage;
                                              });
                                            }
                                          },
                                          enabled: _editEnabled,
                                          cursorColor: kMarronColor,
                                          decoration: const InputDecoration(
                                            focusColor: kMarronColor,
                                            hintText: "Type custom message",
                                          ),
                                          initialValue: _editedMessage,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 24, bottom: 6),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(
                                          width: 1,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            _sosMessage.message =
                                                _globalMessage;
                                            SosMessageService()
                                                .updateSosMessage(
                                                    id, _sosMessage)
                                                .then((value) {
                                              changeSOSmessagePref(
                                                  _globalMessage);
                                              Navigator.pop(context);
                                            });
                                            // Navigator.of(context).pop(true);
                                          },
                                          child: const Text(
                                            'SAVE',
                                            style: TextStyle(
                                                color: kMarronColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.message,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Customized Message',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          Text(
                            'Customize your SOS',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      )
                    ],
                  ),
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
