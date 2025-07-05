import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final  name = (arguments is String) ? arguments : 'Guest';
    // ignore: unused_local_variable
    int selectedIndex = 0;
    // ignore: unused_local_variable
    final List<String> categories = ['Hottest', 'Popular', 'New combo', 'Top'];
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[900]
                    : Colors.orange,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double avatarSize = constraints.maxHeight * 0.4;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: avatarSize/1.5,
                        child: Icon(Icons.person,size: 40,),
                        //backgroundImage: AssetImage('assets/images/profile.jpg'),
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text('$name',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '$name@gmail.com',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_basket),
              title: const Text('My Basket'),
              onTap: () {
                Navigator.pushNamed(context, '/basket');
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorite'),
              onTap: () {
               // Navigator.pushNamed(context, '/about'); // if available
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
               // Navigator.pushNamed(context, '/auth');
              },
            ),
            ListTile(
              leading: const Icon(Icons.shop),
              title: const Text('Cart'),
              onTap: () {
               // Navigator.pushNamed(context, '/auth');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushNamed(context, '/auth');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              // Top Row
              Row(
                children: [
                  Builder(
                    builder: (context) => // 👇 this opens the Drawer
                    IconButton(
                      icon: const Icon(Icons.menu, size: 28, color: Colors.deepPurple),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/basket');
                    },
                    child: Column(
                      children: [
                        const Icon(
                          Icons.shopping_basket_outlined,
                          color: Colors.orange,
                          size: 30,
                        ),
                        const Text(
                          'My basket',
                          style: TextStyle(fontSize: 10, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Greeting Text
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Hello, $name!\n",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const TextSpan(
                      text: 'What fruit salad combo do you want today?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F3F3),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Fruit',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.tune, color: Colors.deepPurple),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Recommended Combo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF2A254D),
                ),
              ),
              const SizedBox(height: 20),

              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10),
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/product',
                          arguments: {
                            'image': 'assets/images/fruit2.png',
                            'title': 'Honey lime combo',
                            'price': '₦ 2,000',
                          },
                        );
                      },
                      child: const FruitCard(
                        image: 'assets/images/fruit2.png',
                        title: 'Honey lime combo',
                        price: '₦ 2,000',
                      ),
                    ),
                    const SizedBox(width: 25),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/product',
                          arguments: {
                            'image': 'assets/images/fruit2.png',
                            'title': 'Berry mango combo',
                            'price': '₦ 8,000',
                          },
                        );
                      },
                      child: const FruitCard(
                        image: 'assets/images/fruit2.png',
                        title: 'Berry mango combo',
                        price: '₦ 8,000',
                      ),
                    ),
                  ],
                ),
              ),


              const SizedBox(height: 20),
              const Text(
                'Hottest',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF2A254D),
                ),
              ),
              const SizedBox(height: 20),

              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/product',
                          arguments: {
                            'image': 'assets/images/fruit1.png',
                            'title': 'Quinoa fruit salad',
                            'price': '₦ 10,000',
                          },
                        );
                      },
                      child: const FruitCard(
                        image: 'assets/images/fruit1.png',
                        title: 'Quinoa fruit salad',
                        price: '₦ 10,000',
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/product',
                          arguments: {
                            'image': 'assets/images/fruit1.png',
                            'title': 'Tropical fruit salad',
                            'price': '₦ 10,000',
                          },
                        );
                      },
                      child: const FruitCard(
                        image: 'assets/images/fruit1.png',
                        title: 'Tropical fruit salad',
                        price: '₦ 10,000',
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/product',
                          arguments: {
                            'image': 'assets/images/fruit1.png',
                            'title': 'Tropical fruit salad',
                            'price': '₦ 10,000',
                          },
                        );
                      },
                      child: const FruitCard(
                        image: 'assets/images/fruit1.png',
                        title: 'Tropical fruit salad',
                        price: '₦ 10,000',
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/product',
                          arguments: {
                            'image': 'assets/images/fruit1.png',
                            'title': 'Tropical fruit salad',
                            'price': '₦ 10,000',
                          },
                        );
                      },
                      child: const FruitCard(
                        image: 'assets/images/fruit1.png',
                        title: 'Tropical fruit salad',
                        price: '₦ 10,000',
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

// Unchanged FruitCard remains the same
class FruitCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const FruitCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  height: 75,
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                right: 0,
                top: 0,
                child: Icon(Icons.favorite_border, color: Colors.orange),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CircleAvatar(
                radius: 12,
                backgroundColor: Color(0xFFFFA451),
                child: Icon(Icons.add, size: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
