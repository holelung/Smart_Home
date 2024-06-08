import 'package:flutter/material.dart';
import 'package:smart_home_project/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB3xBh2DaOlytZRxqlGTlzUNK7lQImoIXQ",
      appId: "1:154118658655:android:4bcf4147303f54ae0e19ea",
      messagingSenderId: "154118658655",
      projectId: "cdss-71838",
    ),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
