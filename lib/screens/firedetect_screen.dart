import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';
import 'package:flutter_reorderable_grid_view/widgets/widgets.dart';
import 'package:firebase_core/firebase_core.dart';

class FiredetectScreen extends StatefulWidget {
  const FiredetectScreen({super.key});

  @override
  State<FiredetectScreen> createState() => _FiredetectScreenState();
}

class _FiredetectScreenState extends State<FiredetectScreen> {
  final ref = FirebaseDatabase.instance.ref('SmartHome');
  final _scrollController = ScrollController();
  final _gridViewKey = GlobalKey();
  final rooms = ['LivingRoom', 'Kitchen', 'Toilet', 'Room1'];

  final icons = [
    Icons.family_restroom,
    Icons.kitchen,
    Icons.shower,
    Icons.sensor_door_sharp
  ];

  var isMobile = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isMobile = MediaQuery.of(context).size.width < 900;
  }

  @override
  Widget build(BuildContext context) {
    final generatedChildren = List.generate(
      rooms.length,
      (index) => Container(
        key: Key(rooms[index]),
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
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
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: FirebaseAnimatedList(
                      shrinkWrap: true,
                      query: ref.child(rooms[index]).child('Gas'),
                      itemBuilder: (context, snapshot, animation, idx) {
                        return SizedBox(
                          width: 100,
                          height: 30,
                          child: ListTile(
                            title: Text(
                              style: const TextStyle(fontSize: 14),
                              "가스:  ${snapshot.child('Gas').value}ppm",
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: FirebaseAnimatedList(
                      shrinkWrap: true,
                      query: ref.child(rooms[index]).child('GasS'),
                      itemBuilder: (context, snapshot, animation, idx) {
                        return SizedBox(
                          height: 30,
                          child: ListTile(
                            title: Text(
                              style: const TextStyle(fontSize: 14),
                              "(${snapshot.child('GasS').value})",
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: FirebaseAnimatedList(
                      shrinkWrap: true,
                      query: ref.child(rooms[index]).child('Flame'),
                      itemBuilder: (context, snapshot, animation, idx) {
                        return SizedBox(
                          width: 100,
                          height: 30,
                          child: ListTile(
                            title: Text(
                              style: const TextStyle(fontSize: 14),
                              "불꽃세기:${snapshot.child('Flame').value}",
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: FirebaseAnimatedList(
                      shrinkWrap: true,
                      query: ref.child(rooms[index]).child('FlameS'),
                      itemBuilder: (context, snapshot, animation, idx) {
                        return SizedBox(
                          height: 30,
                          child: ListTile(
                            title: Text(
                              style: const TextStyle(fontSize: 14),
                              "(${snapshot.child('FlameS').value})",
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: FirebaseAnimatedList(
                      shrinkWrap: true,
                      query: ref.child(rooms[index]).child('InfraredS'),
                      itemBuilder: (context, snapshot, animation, idx) {
                        return const SizedBox(
                          height: 30,
                          child: ListTile(
                            title: Text(
                              style: TextStyle(fontSize: 14),
                              "인체감지  :    ",
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: FirebaseAnimatedList(
                      shrinkWrap: true,
                      query: ref.child(rooms[index]).child('InfraredS'),
                      itemBuilder: (context, snapshot, animation, idx) {
                        return SizedBox(
                          height: 30,
                          child: ListTile(
                            title: Text(
                              style: const TextStyle(fontSize: 14),
                              " ${snapshot.child('InfraredS').value}",
                            ),
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
        body: ReorderableBuilder(
          longPressDelay: const Duration(milliseconds: 200),
          scrollController: _scrollController,
          onReorder: (List<OrderUpdateEntity> orderUpdateEntities) {
            for (final orderUpdateEntity in orderUpdateEntities) {
              final room = rooms.removeAt(orderUpdateEntity.oldIndex);
              rooms.insert(orderUpdateEntity.newIndex, room);
            }
          },
          builder: (children) {
            return GridView(
              key: _gridViewKey,
              controller: _scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 20,
                childAspectRatio: isMobile ? 1.5 : 2,
              ),
              children: children,
            );
          },
          children: generatedChildren,
        ),
      ),
    );
  }
}
