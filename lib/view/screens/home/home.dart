import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _welcomeBanner(),
            const SizedBox(height: 28),
            Wrap(
              spacing: 14,
              runSpacing: 12,
              children: [
                _modulesCard("Dashboard"),
                _modulesCard("About"),
                _modulesCard("Profile")
              ],
            )
          ],
        ),
      ),
    );
  }

  Text _welcomeBanner() {
    return const Text(
      "Welcome!",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
    );
  }

  GestureDetector _modulesCard(String name) {
    return GestureDetector(
      child: Material(
        elevation: 3,
        child: Container(
          width: 250,
          height: 100,
          color: Colors.blue.shade100,
          child: Center(
              child: Text(
            name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          )),
        ),
      ),
      onTap: () {
        if (name == "About") {
          context.go("/about");
        } else if (name == "Profile") {
          // context.go("/profile");
          context.go("/profile?name=Ajay&email=ajay.2671999@gmail.com");
        } else if (name == "Dashboard") {
          context.go("/dashboard");
        }
      },
    );
  }
}
