import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_home_project/screens/firedetect_screen.dart';
import 'package:smart_home_project/screens/light_screen.dart';
import 'package:smart_home_project/screens/main_content_screen.dart';
import 'package:smart_home_project/screens/security_screen.dart';
import 'package:smart_home_project/screens/setting_screen.dart';
import 'package:smart_home_project/screens/temperature_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isNavigationPaneVisible = true;
  var selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final isMobile = MediaQuery.of(context).size.width < 600;
    isNavigationPaneVisible = !isMobile;
  }

  void toggleNavigationPane() {
    setState(() {
      isNavigationPaneVisible = !isNavigationPaneVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const MainContent();
        break;
      case 1:
        page = const SecurityScreen();
        break;
      case 2:
        page = const TemperatureScreen();
      case 3:
        page = const LightScreen();
        break;
      case 4:
        page = const FiredetectScreen();
        break;
      case 5:
        page = const SettingScreen();
        break;
      default:
        throw UnimplementedError('no Widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (
      context,
      constraints,
    ) {
      return Scaffold(
        backgroundColor: const Color(0xFFF0F0F0),
        body: SafeArea(
          child: Column(
            children: [
              Header(toggleNavigationPane: toggleNavigationPane),
              Expanded(
                child: Row(
                  children: [
                    if (isNavigationPaneVisible)
                      SafeArea(
                        child: NavigationRail(
                          selectedIndex: selectedIndex,
                          extended: constraints.maxWidth >= 600,
                          destinations: const [
                            NavigationRailDestination(
                              icon: FaIcon(FontAwesomeIcons.house),
                              label: Text('Home'),
                            ),
                            NavigationRailDestination(
                              icon: FaIcon(FontAwesomeIcons.lock),
                              label: Text('Security'),
                            ),
                            NavigationRailDestination(
                              icon: FaIcon(FontAwesomeIcons.temperatureHalf),
                              label: Text('Temperature'),
                            ),
                            NavigationRailDestination(
                              icon: FaIcon(FontAwesomeIcons.lightbulb),
                              label: Text('Lighting'),
                            ),
                            NavigationRailDestination(
                              icon: FaIcon(FontAwesomeIcons.fire),
                              label: Text('FireDetect'),
                            ),
                            NavigationRailDestination(
                              icon: FaIcon(FontAwesomeIcons.gear),
                              label: Text('Settings'),
                            ),
                          ],
                          onDestinationSelected: (value) {
                            setState(() {
                              selectedIndex = value;
                            });
                          },
                        ),
                      ),
                    Expanded(
                      child: page,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class Header extends StatelessWidget {
  final VoidCallback toggleNavigationPane;

  const Header({super.key, required this.toggleNavigationPane});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.blue),
                onPressed: toggleNavigationPane,
              ),
              const SizedBox(width: 10.0),
              const Text(
                "Itc 801",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Row(
            children: [
              Icon(Icons.person_add, color: Colors.blue),
              SizedBox(width: 20.0),
              Icon(Icons.settings, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}
