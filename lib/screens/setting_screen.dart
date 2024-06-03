import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';
import 'package:flutter_reorderable_grid_view/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_home_project/widgets/device_card_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _scrollController = ScrollController();
  final _gridViewKey = GlobalKey();
  final rooms = <String>[
    "다크 모드",
    "Bed Room",
    "Bath Room",
    "Kitchen",
  ];
  final status = <String>[
    "Off",
    "Off",
    "Off",
    "Off",
  ];

  var isMobile = false;
  // 모바일 화면인지 체크
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isMobile = MediaQuery.of(context).size.width < 600;
  }

  @override
  Widget build(BuildContext context) {
    final generatedChildren = List.generate(
      rooms.length,
      (index) => Container(
        key: Key(rooms.elementAt(index)),
        child: DeviceCard(
          title: rooms.elementAt(index),
          icon: FontAwesomeIcons.lightbulb,
          status: 'Status: ${rooms.elementAt(index)}',
          active: index % 2 == 0, // Just an example, make some cards active
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(10),
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
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
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
