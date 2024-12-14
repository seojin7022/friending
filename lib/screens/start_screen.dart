import 'package:flutter/material.dart';
import 'package:friending/screens/join_screen.dart';
import 'package:friending/screens/login_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 200),
            const Text("Comes here first? Start right now!"),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const JoinScreen();
                }));
              },
              child: const Text("Start now!"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }));
              },
              child: const Text("Or do you already have an account? -> Login"),
            ),
          ],
        ),
      ),
    );
  }
}
