import 'package:flutter/material.dart';
import 'home_page.dart';
import 'payment_page.dart';
import 'summary_page.dart';
import 'first_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5AB48E),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'PROFILE',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile/download_1.jpeg'), // Replace with your image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 50),
            _buildProfileButton(
              context,
              'Feedback',
              () {
                _showFeedbackDialog(context);
              },
            ),
            const SizedBox(height: 20),
            _buildProfileButton(
              context,
              'Payment',
              () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentPage()));
              },
            ),
            const SizedBox(height: 20),
            _buildProfileButton(
              context,
              'Order Summary',
              () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SummaryPage()));
              },
            ),
            const SizedBox(height: 20),
            _buildProfileButton(
              context,
              'Logout',
              () {
                // Ensure first page replaces the navigation stack
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const FirstPage()), (route) => false);
              },
            ),
            const Spacer(),
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
                    onPressed: () {}, // Already on Profile
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

  Widget _buildProfileButton(BuildContext context, String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(
            colors: [Color(0xFFC8E6C9), Color(0xFF718C7E)],
          ),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  void _showFeedbackDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Feedback Note'),
          content: const TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Enter your feedback here...',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Feedback Submitted')));
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
