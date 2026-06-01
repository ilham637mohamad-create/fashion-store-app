import 'package:flutter/material.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'Clothes_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5AB48E),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            
            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),

            // List of Categories
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ClothesPage()));
                    },
                    child: _buildCategoryCard('assets/images/Categories/download_1.jpeg', 'Clothes'),
                  ),
                  const SizedBox(height: 15),
                  _buildCategoryCard('assets/images/Categories/download_2.jpeg', 'Bags'),
                  const SizedBox(height: 15),
                  _buildCategoryCard('assets/images/Categories/download_3.jpeg', 'Shoes'),
                  const SizedBox(height: 15),
                  _buildCategoryCard('assets/images/Categories/download_4.jpeg', ''), // Bottom image
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildCategoryCard(String imagePath, String title) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: title.isNotEmpty ? Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(color: Colors.black, blurRadius: 4, offset: Offset(1, 1)),
            Shadow(color: Colors.black, blurRadius: 4, offset: Offset(-1, -1)),
            Shadow(color: Colors.black, blurRadius: 4, offset: Offset(1, -1)),
            Shadow(color: Colors.black, blurRadius: 4, offset: Offset(-1, 1)),
          ]
        ),
      ) : null,
    );
  }

  Widget _buildBottomNav() {
    return Builder(
      builder: (context) => Container(
        height: 60,
        color: const Color(0xFFDDDDDD),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home_outlined, size: 35, color: Colors.black),
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
              },
            ),
            IconButton(
              icon: const Icon(Icons.person, size: 35, color: Colors.black),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border, size: 35, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
