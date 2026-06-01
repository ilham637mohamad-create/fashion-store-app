import 'package:flutter/material.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'product_page.dart';

class ClothesPage extends StatelessWidget {
  const ClothesPage({super.key});

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
                'Clothes',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Grid of Clothes
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.65, // matching the tall ratio seen in the image
                children: [
                  _buildProductCard(
                    context, 
                    'assets/images/Clothes/download_1.png', 
                    'Couple Dress', 
                    '\$140.00'
                  ),
                  _buildProductCard(
                    context, 
                    'assets/images/Clothes/download_2.png', 
                    'T-Shirt', 
                    '\$40.00'
                  ),
                  _buildProductCard(
                    context, 
                    'assets/images/Clothes/download_3.png', 
                    'Indian Top', 
                    '\$70.00'
                  ),
                  _buildProductCard(
                    context, 
                    'assets/images/Clothes/download_4.png', 
                    'Full Set Combo', 
                    '\$120.00',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProductPage()),
                      );
                    }
                  ),
                  _buildProductCard(
                    context, 
                    'assets/images/Clothes/download_5.png', 
                    'Active Wear', 
                    '\$50.00'
                  ),
                  _buildProductCard(
                    context, 
                    'assets/images/Clothes/download_6.png', 
                    'Casual Shirt', 
                    '\$45.00'
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildProductCard(BuildContext context, String imagePath, String title, String price, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFC8E6C9),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.contain, // or scaleDown based on the images, mock uses transparent bg images
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          Text(
            price,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
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
