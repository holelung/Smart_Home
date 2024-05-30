import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isNavigationPaneVisible = true;

  void toggleNavigationPane() {
    setState(() {
      isNavigationPaneVisible = !isNavigationPaneVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: SafeArea(
        child: Column(
          children: [
            Header(toggleNavigationPane: toggleNavigationPane),
            Expanded(
              child: Row(
                children: [
                  if (isNavigationPaneVisible) const NavigationPane(),
                  const Expanded(
                    child: MainContent(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
                "Junho's Home",
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

class NavigationPane extends StatelessWidget {
  const NavigationPane({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      color: Colors.white,
      child: const Column(
        children: [
          NavItem(icon: FontAwesomeIcons.lock, label: 'Security'),
          NavItem(icon: FontAwesomeIcons.thermometerHalf, label: 'Temperature'),
          NavItem(icon: FontAwesomeIcons.lightbulb, label: 'Lighting'),
          NavItem(icon: FontAwesomeIcons.lifeRing, label: 'Support'),
          NavItem(icon: FontAwesomeIcons.cog, label: 'Settings'),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const NavItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FaIcon(icon, color: Colors.blue),
      title: Text(label),
      onTap: () {},
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: const Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DeviceCard(
                  title: 'Smart Light',
                  icon: FontAwesomeIcons.lightbulb,
                  status: '50% Brightness',
                  active: true,
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: DeviceCard(
                  title: 'Thermostat',
                  icon: FontAwesomeIcons.thermometerHalf,
                  status: '24.3°C',
                  active: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DeviceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String status;
  final bool active;

  const DeviceCard({
    super.key,
    required this.title,
    required this.icon,
    required this.status,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FaIcon(icon, color: active ? Colors.blue : Colors.grey),
                const SizedBox(width: 10.0),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              status,
              style: TextStyle(
                fontSize: 16.0,
                color: active ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
