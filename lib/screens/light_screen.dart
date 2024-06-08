import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';
import 'package:flutter_reorderable_grid_view/widgets/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';

class LightScreen extends StatefulWidget {
  const LightScreen({super.key});

  @override
  State<LightScreen> createState() => _LightScreenState();
}

class _LightScreenState extends State<LightScreen> {
  final _scrollController = ScrollController();
  final _gridViewKey = GlobalKey();
  final rooms = <String>['LivingRoom', 'Kitchen', 'Toilet', 'Room1'];

  final icons = <IconData>[
    Icons.family_restroom,
    Icons.kitchen,
    Icons.bathtub_outlined,
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
        key: Key(rooms.elementAt(index)),
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
            const SizedBox(height: 10),
            Expanded(
              child: FirebaseAnimatedList(
                query: FirebaseDatabase.instance
                    .ref('SmartHome/${rooms[index]}')
                    .child('Light'),
                itemBuilder: (context, snapshot, animation, idx) {
                  String ledState = snapshot
                      .child('${rooms[index]}_LED_STATE')
                      .value
                      .toString();
                  bool isOn = ledState == 'On';

                  return Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            icons[index],
                            color: isOn ? Colors.blue : Colors.grey,
                          ),
                          const SizedBox(width: 8),
                          Text(rooms.elementAt(index)),
                          const SizedBox(width: 10),
                          IconButton(
                            iconSize: 40,
                            icon: Icon(
                              isOn ? Icons.toggle_on : Icons.toggle_off,
                            ),
                            color: isOn ? Colors.blue : Colors.grey,
                            onPressed: () {
                              String newState = isOn ? 'Off' : 'On';
                              FirebaseDatabase.instance
                                  .ref('SmartHome/${rooms[index]}')
                                  .child('Light')
                                  .update(
                                      {'${rooms[index]}_LED_STATE': newState});
                            },
                          ),
                        ],
                      ),
                      ListTile(
                        title: Text("LED : $ledState"),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(20), // TemperatureScreen의 패딩 값과 동일하게 설정
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
                childAspectRatio: (isMobile ? 1.5 : 2),
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
