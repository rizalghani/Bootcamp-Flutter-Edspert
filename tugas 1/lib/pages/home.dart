import 'package:flutter/material.dart';
import 'package:mobile_app/pages/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Home Page"),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   height: 60,
            //   width: 60,
            //   decoration: const BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: Colors.lightGreen,
            //   ),
            // ),
            Image.asset(
              "assets/images/profile.png",
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 16),
            const Text("Mohamad Rizal Ghani"),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (const ProfilePage()),
                  ),
                );
              },
              child: const Text("My Profile"),
            )
          ],
        ),
      ),
    );
  }
}
