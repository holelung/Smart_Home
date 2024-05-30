import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_home_project/widgets/device_card_widget.dart';

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
