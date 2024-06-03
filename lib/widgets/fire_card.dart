import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FireSensorCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool gasDetected;
  final bool flameDetected;
  final bool motionDetected;
  final double temperature;
  final bool Danger;

  const FireSensorCard({
    super.key,
    required this.title,
    required this.icon,
    required this.gasDetected,
    required this.flameDetected,
    required this.motionDetected,
    required this.temperature,
    required this.Danger,
  });

  @override
  State<FireSensorCard> createState() => _FireSensorCardState();
}

class _FireSensorCardState extends State<FireSensorCard> {
  late bool _isDanger;
  @override
  void initState() {
    super.initState();
    _isDanger = widget.Danger;
  }

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
                FaIcon(
                  widget.icon,
                  color: _isDanger ? Colors.red : Colors.green,
                ),
                const SizedBox(width: 10.0),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Icon(
                  widget.gasDetected ? Icons.check_circle : Icons.remove_circle,
                  color: widget.gasDetected ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 5.0),
                Text(
                  'Gas: ${widget.gasDetected ? 'Detected' : 'Not Detected'}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: widget.gasDetected ? Colors.black : Colors.grey,
                  ),
                ),
                const SizedBox(width: 10.0),
              ],
            ),
            Row(
              children: [
                Icon(
                  widget.flameDetected
                      ? Icons.check_circle
                      : Icons.remove_circle,
                  color: widget.flameDetected ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 5.0),
                Text(
                  'Flame: ${widget.flameDetected ? 'Detected' : 'Not Detected'}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: widget.flameDetected ? Colors.black : Colors.grey,
                  ),
                ),
                const SizedBox(width: 10.0),
              ],
            ),
            Row(
              children: [
                Icon(
                  widget.motionDetected
                      ? Icons.check_circle
                      : Icons.remove_circle,
                  color: widget.motionDetected ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 5.0),
                Text(
                  'Motion: ${widget.motionDetected ? 'Detected' : 'Not Detected'}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: widget.motionDetected ? Colors.black : Colors.grey,
                  ),
                ),
                const SizedBox(width: 10.0),
              ],
            ),
            const SizedBox(height: 10.0),
            Text(
              'Temperature: ${widget.temperature}°C',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
