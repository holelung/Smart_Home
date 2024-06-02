import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ToggleCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final String status;
  final bool active;

  const ToggleCard({
    super.key,
    required this.title,
    required this.icon,
    required this.status,
    required this.active,
  });

  @override
  _ToggleCardState createState() => _ToggleCardState();
}

class _ToggleCardState extends State<ToggleCard> {
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _isActive = widget.active;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FaIcon(widget.icon,
                        color: _isActive ? Colors.blue : Colors.grey),
                    const SizedBox(width: 10.0),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: _isActive ? Colors.black : Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: Center(
                    // Center 위젯을 추가하여 토글 버튼을 중앙에 정렬합니다.
                    child: IconButton(
                      iconSize: 40,
                      icon:
                          Icon(_isActive ? Icons.toggle_on : Icons.toggle_off),
                      color: _isActive ? Colors.blue : Colors.grey,
                      onPressed: () {
                        setState(() {
                          _isActive = !_isActive;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              _isActive ? "On" : "Off",
              style: TextStyle(
                fontSize: 16.0,
                color: _isActive ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
