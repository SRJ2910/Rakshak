import 'package:flutter/material.dart';
import 'package:rakshak/custom_widgets/cutom_bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainPage(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

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
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        'We admire',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        'Your strong personality.',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                ),
                const Icon(Icons.settings_applications_sharp)
              ],
            ),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Card(
                  color: Colors.grey,
                  child: SizedBox(
                    height: 200,
                    width: 300,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Card(
                  color: Colors.grey,
                  child: SizedBox(
                    height: 200,
                    width: 300,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
