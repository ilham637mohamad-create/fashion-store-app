import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'Payment_page.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5AB48E),
      body: SafeArea(
        child: SingleChildScrollView(  // ✅ FIX 1: Added scrolling
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
              
              // Hero Image Area
              Container(
                height: 220,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFC8E6C9), Color(0xFF86A893)], 
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/images/product/download_1.png', 
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          '40%\noff',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            height: 1.1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              // Thumbnail Images Row
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    _buildThumbnail('assets/images/product/download_2.jpeg'),
                    const SizedBox(width: 10),
                    _buildThumbnail('assets/images/product/download_3.jpeg'),
                    const SizedBox(width: 10),
                    _buildThumbnail('assets/images/product/download_4.jpeg'),
                    const SizedBox(width: 10),
                    _buildThumbnail('assets/images/product/download_5.jpeg'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Product Details
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Set Combo',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '\$120.00',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              // Badges
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Wrap(  // ✅ FIX 2: Wrap instead of Row for responsive
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _buildBadge('4 Pair Left'),
                    _buildBadge('Sold  40'),
                    _buildBadge('4.7 (69 Reviews)'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Color selection
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Select the Color',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Wrap(  // ✅ FIX 3: Wrap for responsive color selection
                  spacing: 15,
                  runSpacing: 10,
                  children: [
                    _buildColorBox(const Color(0xFF4A3E4E)), // Dark grey
                    _buildColorBox(const Color(0xFFE2CBB7)), // Beige
                    _buildColorBox(const Color(0xFFAAA6A7)), // Light grey
                    _buildColorBox(const Color(0xFF9FCFFB)), // Light blue
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Bottom Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CartPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB1E1C5),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text('Add to Cart', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const PaymentPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB1E1C5),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text('Buy Now', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20), // ✅ FIX 4: Extra bottom padding
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnail(String imagePath) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFB1E1C5), 
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black),
      ),
    );
  }

  Widget _buildColorBox(Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}