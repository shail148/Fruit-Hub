import 'package:flutter/material.dart';
import 'package:fruit_hub/data/cart_data.dart'; // Your cart data file

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // Retrieve the passed arguments
    final Map<String, dynamic> args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final String image = args['image'];
    final String title = args['title'];
    final String priceStr = args['price']; // e.g. ₦ 2,000
    final int price = int.parse(priceStr.replaceAll(RegExp(r'[^\d]'), ''));

    return Scaffold(
      backgroundColor: const Color(0xFFFFA75D), // Background color
      body: SafeArea(
        child: Column(
          children: [
            // Back button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.deepPurple),
                    label: const Text(
                      'Go back',
                      style: TextStyle(color: Colors.deepPurple, fontSize: 12),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: const StadiumBorder(),
                    ),
                  ),
                ],
              ),
            ),

            // Product image
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(image),
              ),
            ),
            const SizedBox(height: 30),

            // Expanded content container
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    // Top content inside inner Expanded
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Color(0xFF2A254D),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Quantity selector and total price
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline,
                                    size: 30, color: Color(0xFFFFA75D)),
                                onPressed: () {
                                  if (quantity > 1) {
                                    setState(() {
                                      quantity--;
                                    });
                                  }
                                },
                              ),
                              Text(
                                quantity.toString(),
                                style: const TextStyle(fontSize: 18),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline,
                                    size: 30, color: Color(0xFFFFA75D)),
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                              ),
                              const Spacer(),
                              Text(
                                '₦ ${price * quantity}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2A254D),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),

                          // Description
                          const Text(
                            'One Pack Contains:',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.orange,
                              decorationThickness: 3,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF2A254D),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.',
                            style: TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you, make.',
                            style: TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),

                    // Add to basket and favorite button fixed at bottom
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {},
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              final existingIndex = cart.indexWhere(
                                    (item) => item['title'] == title,
                              );

                              if (existingIndex != -1) {
                                cart[existingIndex]['quantity'] += quantity;
                              } else {
                                cart.add({
                                  'title': title,
                                  'price': priceStr,
                                  'image': image,
                                  'quantity': quantity,
                                });
                              }

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Item added to cart!'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFA75D),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Add to basket',
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
