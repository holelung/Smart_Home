import 'package:flutter/material.dart';
import 'package:smart_home_project/widgets/security_button_widget.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  var isMobile = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isMobile = MediaQuery.of(context).size.width < 1100;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: isMobile
          ? SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    'https://st.depositphotos.com/2274151/3518/i/450/depositphotos_35186549-stock-photo-sample-grunge-red-round-stamp.jpg',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Flexible(
                    fit: FlexFit.loose,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SecurityButton(
                          text: '통화',
                          icon: Icons.call,
                        ),
                        SecurityButton(
                          text: '열림',
                          icon: Icons.lock_open_rounded,
                        ),
                        SecurityButton(
                          text: '방범',
                          icon: Icons.sensor_occupied_rounded,
                        ),
                        SecurityButton(
                          text: '기록',
                          icon: Icons.folder_open_rounded,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          : Row(
              children: [
                Image.network(
                  'https://st.depositphotos.com/2274151/3518/i/450/depositphotos_35186549-stock-photo-sample-grunge-red-round-stamp.jpg',
                ),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SecurityButton(
                        text: '통화',
                        icon: Icons.call,
                      ),
                      SecurityButton(
                        text: '열림',
                        icon: Icons.lock_open_rounded,
                      ),
                      SecurityButton(
                        text: '방범',
                        icon: Icons.sensor_occupied_rounded,
                      ),
                      SecurityButton(
                        text: '기록',
                        icon: Icons.folder_open_rounded,
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
