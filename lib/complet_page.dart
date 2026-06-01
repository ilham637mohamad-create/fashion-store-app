import 'package:flutter/material.dart';
import 'summary_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

class CompletPage extends StatelessWidget {
  const CompletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5AB48E),
      body: SafeArea(
        child: Column(
          children: [
            // Top back button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            
            const Spacer(),
            
            // Checkmark Image
            Image.asset(
              'assets/images/complet/download_1.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 30),
            
            // Text
            const Text(
              'ORDER COMPLETED',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 40),
            
            // View Order Button
            SizedBox(
              width: 160,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SummaryPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC8E6C9), // Light green
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text(
                  'View Order',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            
            const Spacer(),
            
            // Bottom Navigation Area
            Container(
              height: 60,
              color: const Color(0xFFE0E0E0), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home_outlined, size: 30, color: Colors.black),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.person, size: 30, color: Colors.black),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite_border, size: 30, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
