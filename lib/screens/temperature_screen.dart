import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final ref = FirebaseDatabase.instance.ref('SmartHome');
  final rooms = ['LivingRoom', 'Kitchen', 'Toilet', 'Room1'];

  final icons = [
    Icons.family_restroom,
    Icons.kitchen,
    Icons.bathtub_outlined,
    Icons.sensor_door_sharp
  ];

  @override
  Widget build(BuildContext context) {
    final generatedChildren = List.generate(
      rooms.length,
      (index) => Container(
        key: Key(rooms[index]),
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 6,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icons[index],
                  color: Colors.black,
                ),
                const SizedBox(width: 8),
                Text(
                  rooms[index],
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(), // 간격 줄이기
                    child: FirebaseAnimatedList(
                      shrinkWrap: true,
                      query: ref.child(rooms[index]).child('Tem'),
                      itemBuilder: (context, snapshot, animation, idx) {
                        return ListTile(
                          title: Text(
                            "온도:     ${snapshot.child('Tem').value}°C",
                            style: const TextStyle(fontSize: 14),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(), // 간격 줄이기
                    child: FirebaseAnimatedList(
                      shrinkWrap: true,
                      query: ref.child(rooms[index]).child('Tems'),
                      itemBuilder: (context, snapshot, animation, idx) {
                        return ListTile(
                          title: Text(
                            "(${snapshot.child('Tems').value})",
                            style: const TextStyle(fontSize: 14),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Scaffold(
        body: GridView.count(
          crossAxisCount: MediaQuery.of(context).size.width < 900 ? 1 : 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 20,
          childAspectRatio: MediaQuery.of(context).size.width < 900 ? 1.5 : 2,
          children: generatedChildren,
        ),
      ),
    );
  }
}
