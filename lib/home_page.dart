import 'package:flutter/material.dart';
import 'categories_page.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF5AB48E), Color(0xFFBBE5CE)],
            stops: [0.0, 0.4], 
          ),
        ),
        child: SafeArea(
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
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'ILHAM FASHION\nSTORES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    height: 1.1,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Hinted search text',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.menu, color: Colors.black87),
                      suffixIcon: Icon(Icons.search, color: Colors.black87),
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Expanded area with darker green background
              Expanded(
                child: Container(
                  color: const Color(0xFF5AB48E),
                  child: Column(
                    children: [
                      // Categories scroll
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                        child: Row(
                          children: [
                            _buildCategoryChip('All', true),
                            const SizedBox(width: 10),
                            _buildCategoryChip('T-Shirt', false),
                            const SizedBox(width: 10),
                            _buildCategoryChip('Trouser', false),
                            const SizedBox(width: 10),
                            _buildCategoryChip('Bottom', false),
                            const SizedBox(width: 10),
                            _buildCategoryChip('Shoes', false),
                          ],
                        ),
                      ),

                      // Grid Content
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          children: [
                            // Row 1: New Arrivals, Gym Wears 
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 160,
                                    child: _buildTextCard('New Arrivals', 'Fresh pieces,\nCurated weekly', true),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: SizedBox(
                                    height: 160,
                                    child: _buildImageCard('assets/images/home/download_1.png', 'Gym Wears'),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            // Row 2: View All, Cart 
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoriesPage()));
                                    },
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFC8E6C9),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('View All', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                                          SizedBox(width: 5),
                                          Icon(Icons.arrow_forward, color: Colors.black),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFC8E6C9),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text('Cart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            // Row 3: Finish the look, Everyday 
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 160,
                                    child: _buildImageCard('assets/images/home/download_2.png', 'Finish the\nlook', true),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: SizedBox(
                                    height: 160,
                                    child: _buildImageCard('assets/images/home/download_3.png', 'Everyday', true),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFC8E6C9), // All use the same light green
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
      ),
    );
  }

  Widget _buildTextCard(String title, String subtitle, bool showArrow) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFC8E6C9),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
              if (showArrow) const Icon(Icons.arrow_forward, size: 18),
            ],
          ),
          const SizedBox(height: 8),
          Text(subtitle, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildImageCard(String imagePath, String title, [bool titleTop = false]) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFC8E6C9),
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: titleTop ? [Colors.transparent, Colors.black26] : [Colors.black54, Colors.transparent],
            stops: const [0.0, 0.6],
          ),
        ),
        padding: const EdgeInsets.all(12),
        alignment: titleTop ? Alignment.topLeft : Alignment.bottomCenter,
        child: Text(
          title,
          style: TextStyle(
            color: titleTop ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
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
              onPressed: () {},
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
