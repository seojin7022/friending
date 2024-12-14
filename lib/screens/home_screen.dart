import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<String> menu_list = ["대영고등학교(영주)", "2007년생", "고등학생"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "대영고등학교(영주)",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.person))
          ],
        ),
        // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 93),
              const Text(
                "My Community",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              for (var menu in menu_list)
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(45),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(menu),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              const SizedBox(height: 20),
              const Divider(
                height: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
