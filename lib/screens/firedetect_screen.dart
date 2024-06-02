import 'package:flutter/material.dart';
import 'package:smart_home_project/widgets/fire_card.dart';

class FiredetectScreen extends StatelessWidget {
  const FiredetectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          FireSensorCard(
            title: 'LivingRoom Fire Sensor',
            icon: Icons.family_restroom,
            gasDetected: false, // 가스 감지 여부
            flameDetected: true, // 불꽃 감지 여부
            motionDetected: false, // 인체 감지 여부
            temperature: 23.5, // 온도 센서 값
            Danger: true,
          ),
          FireSensorCard(
            title: 'Kitchen Fire Sensor',
            icon: Icons.kitchen,
            gasDetected: true, // 가스 감지 여부
            flameDetected: false, // 불꽃 감지 여부
            motionDetected: false, // 인체 감지 여부
            temperature: 24.0, // 온도 센서 값
            Danger: false,
          ),
          FireSensorCard(
            title: 'Toilet Fire Sensor',
            icon: Icons.shower,
            gasDetected: true, // 가스 감지 여부
            flameDetected: true, // 불꽃 감지 여부
            motionDetected: true, // 인체 감지 여부
            temperature: 22.8, // 온도 센서 값
            Danger: false,
          ),
          FireSensorCard(
            title: 'Room 1 Fire Sensor',
            icon: Icons.sensor_door_sharp,
            gasDetected: false, // 가스 감지 여부
            flameDetected: false, // 불꽃 감지 여부
            motionDetected: true, // 인체 감지 여부
            temperature: 25.2, // 온도 센서 값
            Danger: true,
          ),
        ],
      ),
    );
  }
}
