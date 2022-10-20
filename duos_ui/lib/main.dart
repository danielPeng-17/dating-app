import 'package:duos_ui/screens/profile_creation_bio.dart';
import 'package:duos_ui/screens/profile_creation_game.dart';
import 'package:duos_ui/screens/profile_creation_name.dart';
import 'package:flutter/material.dart';
import 'package:duos_ui/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Duos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const ProfileCreationGame(),
    );
  }
}
