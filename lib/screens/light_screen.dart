import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_home_project/widgets/device_card_widget.dart';
import 'package:smart_home_project/widgets/toggle_button.dart';

class LightScreen extends StatelessWidget {
  const LightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ToggleCard(
                  title: 'LivingRoom',
                  icon: Icons.family_restroom,
                  status: 'On',
                  active: true,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ToggleCard(
                  title: 'Kitchen',
                  icon: Icons.kitchen,
                  status: 'On',
                  active: true,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ToggleCard(
                  title: 'Toilet',
                  icon: Icons.shower,
                  status: 'On',
                  active: true,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ToggleCard(
                  title: 'room1',
                  icon: Icons.sensor_door_sharp,
                  status: 'On',
                  active: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
