import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                  icon: FontAwesomeIcons.temperatureHalf,
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
