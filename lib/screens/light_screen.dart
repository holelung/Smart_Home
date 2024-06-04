import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';
import 'package:flutter_reorderable_grid_view/widgets/widgets.dart';

class LightScreen extends StatefulWidget {
  const LightScreen({super.key});

  @override
  State<LightScreen> createState() => _LightScreenState();
}

class _LightScreenState extends State<LightScreen> {
  final _scrollController = ScrollController();
  final _gridViewKey = GlobalKey();
  final rooms = <String>[
    "Living Room",
    "Bed Room",
    "Bath Room",
    "Kitchen",
  ];

  final icons = <IconData>[
    Icons.family_restroom,
    Icons.kitchen,
    Icons.shower,
    Icons.sensor_door_sharp
  ];

  final status = <String>[
    "Off",
    "Off",
    "Off",
    "Off",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icons[index],
                  color: status[index] == "On" ? Colors.blue : Colors.grey,
                ),
                const SizedBox(width: 8),
                Text(
                  rooms.elementAt(index),
                ),
                const SizedBox(width: 10),
                IconButton(
                  iconSize: 40,
                  icon: Icon(
                    status[index] == "On" ? Icons.toggle_on : Icons.toggle_off,
                  ),
                  color: status[index] == "On" ? Colors.blue : Colors.grey,
                  onPressed: () {
                    setState(() {
                      status[index] = status[index] == "On" ? "Off" : "On";
                    });
                  },
                ),
                Text(
                  status[index] == "On" ? "On" : "Off",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: status[index] == "On" ? Colors.blue : Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
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
