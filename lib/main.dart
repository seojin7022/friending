import 'package:flutter/material.dart';
import 'package:friending/functions/login.dart';
import 'package:friending/screens/home_screen.dart';
import 'package:friending/screens/start_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  Future<bool> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    print(token);
    if (token == null || token.isEmpty) {
      return false;
    }

    if (await login(token) == null) {
      return false;
    }
    return true;
  }

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friending',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: _checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!) {
              return const HomeScreen();
            } else {
              return const StartScreen();
            }
          } else {
            return const Text("Got some errors!");
          }
        },
      ),
    );
  }
}
