import 'package:flutter/material.dart';
import 'home_page.dart';
import 'profile_page.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5AB48E),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Order Summary',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // Balance the back button
                ],
              ),
            ),
            const SizedBox(height: 10),
            
            // Items List
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                color: const Color(0xFFC8E6C9), // Light green background for items
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ListView(
                  children: [
                    _buildSummaryItem(
                      'assets/images/summary/download_1.jpeg',
                      'Full Set Combo',
                      '\$120.00',
                      'Qty 1',
                    ),
                    const SizedBox(height: 15),
                    _buildSummaryItem(
                      'assets/images/summary/download_2.jpeg',
                      'Indian Top',
                      '\$70.00',
                      'Qty 1',
                    ),
                    const SizedBox(height: 15),
                    _buildSummaryItem(
                      'assets/images/summary/download_3.jpeg',
                      'Jacket',
                      '\$80.00',
                      'Qty 1',
                    ),
                  ],
                ),
              ),
            ),
            
            // order details below items
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
                child: Column(
                  children: [
                    _buildDetailRow('Subtotal', '\$270.00'),
                    const SizedBox(height: 10),
                    _buildDetailRow('Delivery Fee', '\$5.00'),
                    const SizedBox(height: 15),
                    _buildDetailRow('Total', '\$275.00', isBold: true),
                    const SizedBox(height: 15),
                    _buildDetailRow('Debit Card', '\$113.00'),
                    const SizedBox(height: 15),
                    _buildDetailRow('Order No', '321445778239'),
                    const SizedBox(height: 10),
                    _buildDetailRow('Placed On', '08 Sep 2026 11:20:07'),
                    const SizedBox(height: 10),
                    _buildDetailRow('Paid by', 'Debit Card'),
                  ],
                ),
              ),
            ),

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

  Widget _buildSummaryItem(String imagePath, String title, String price, String qty) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black87, width: 1),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Text(
            qty,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isBold ? FontWeight.w900 : FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isBold ? FontWeight.w900 : FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
