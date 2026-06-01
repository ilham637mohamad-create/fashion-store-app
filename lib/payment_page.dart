import 'package:flutter/material.dart';
import 'complet_page.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5AB48E),
      body: SafeArea(
        child: Column(
          children: [
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
                        'Select Payment Method',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                children: [
                  _buildPaymentOption(
                    'Credit/Debit Card',
                    [
                      Image.asset('assets/images/Payment/download_1.png', height: 25),
                      const SizedBox(width: 10),
                      Image.asset('assets/images/Payment/download_2.png', height: 20),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildPaymentOption(
                    'Cash on Delivery',
                    [
                      Image.asset('assets/images/Payment/download_3.png', height: 40),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildPaymentOption(
                    'Instalment',
                    [
                      Image.asset('assets/images/Payment/download_4.png', height: 40),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFC8E6C9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Column(
                children: [
                  _buildSummaryRow('Subtotal', '\$270.00'),
                  const SizedBox(height: 10),
                  _buildSummaryRow('Discount', '\$40%'),
                  const SizedBox(height: 10),
                  _buildSummaryRow('Total Amount', '\$108.00'),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CompletPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF385E4D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Pay Now',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentOption(String title, List<Widget> images) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFC8E6C9),
        borderRadius: BorderRadius.circular(0), // Based on design it has no border radius
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            children: [
              ...images,
              const SizedBox(width: 15),
              const Icon(Icons.arrow_forward, color: Colors.black, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
