import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rakshak/custom_widgets/constants.dart';
import 'package:rakshak/custom_widgets/custom_icon.dart';
import 'package:rakshak/pages/home_page.dart';
import 'package:rakshak/pages/settings.dart';
import 'package:rakshak/services/sos_message_user.dart';
import 'package:rakshak/utils/global.dart';
import 'package:rakshak/utils/locator.dart';
import 'package:vibration/vibration.dart';

class MainPage extends StatefulWidget {
  MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Widget svg = SvgPicture.asset('assets/icons8-settings.svg',
      semanticsLabel: 'Acme Logo');

  void initState() {
    getCurrentLocation();
    super.initState();
  }

  LocationData? currentLocation;

  void getCurrentLocation() {
    Location location = Location();
    location.getLocation().then((location) {
      setState(() {
        currentLocation = location;
      });
    });

    location.onLocationChanged.listen((event) {
      setState(() {
        currentLocation = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        'We admire',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        'Your strong personality.',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                ),
                IconButton(
                  icon: SvgPicture.asset('assets/icons8-settings.svg',
                      color: kMarronColor, semanticsLabel: 'Setting'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingPage()),
                    );
                  },
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: currentLocation == null
                  ? Text('loading')
                  : Container(
                      height: 200,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                            target: LatLng(currentLocation!.latitude!,
                                currentLocation!.longitude!),
                            zoom: 14),
                        markers: {
                          Marker(
                            markerId: MarkerId("current"),
                            position: LatLng(currentLocation!.latitude!,
                                currentLocation!.longitude!),
                          )
                        },
                        circles: {
                          Circle(
                              circleId: CircleId("demo"),
                              center: LatLng(currentLocation!.latitude!,
                                  currentLocation!.longitude!),
                              radius: 400,
                              fillColor: Colors.redAccent.withOpacity(0.4),
                              strokeColor: Colors.transparent),
                        },
                      ),
                    ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, offset: Offset(2.0, 2.0))
                  ]),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 25.0,
                      mainAxisSpacing: 25.0,
                      shrinkWrap: true,
                      children: [
                        Column(
                          children: [
                            CustomIcon(
                              iconPath:
                                  'assets/call_FILL0_wght400_GRAD0_opsz48.svg',
                              iconLabel: 'Fake Call',
                            ),
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'Fake Call',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            index.value = 4;
                          },
                          child: Column(
                            children: [
                              CustomIcon(
                                iconPath:
                                    'assets/share_location_FILL0_wght400_GRAD0_opsz48.svg',
                                iconLabel: 'WhereTo',
                              ),
                              const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  'Where To',
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            index.value = 2;
                          },
                          child: Column(
                            children: [
                              CustomIcon(
                                iconPath:
                                    'assets/history_FILL0_wght400_GRAD0_opsz48.svg',
                                iconLabel: 'sosHistory',
                              ),
                              const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  'SOS History',
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            index.value = 1;
                            // GuardianService()
                            //     .getGuardian('6335a2f65e6db9c43033a158');
                          },
                          child: Column(
                            children: [
                              CustomIcon(
                                iconPath: 'assets/Artboard 100134.svg',
                                iconLabel: 'Guardian',
                              ),
                              const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  'Guardians',
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            SosMessageService()
                                .sendSos()
                                .then((value) => locator<GlobalServices>()
                                    .successSnackBar("SOS sent successfully ✔"))
                                .whenComplete(
                                    () => Vibration.vibrate(duration: 1000));
                          },
                          child: Column(
                            children: [
                              CustomIcon(
                                iconPath:
                                    'assets/edgesensor_high_FILL0_wght400_GRAD0_opsz48.svg',
                                iconLabel: 'shake',
                              ),
                              const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  'Safe Shake',
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            CustomIcon(
                              iconPath:
                                  'assets/call_FILL0_wght400_GRAD0_opsz48.svg',
                              iconLabel: 'HelpLine',
                            ),
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'Helpline',
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
