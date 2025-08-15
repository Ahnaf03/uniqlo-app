import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_application_2/models/product.dart';
import 'package:flutter_application_2/product_detail_page.dart';
import 'package:flutter_application_2/cart_page.dart';
import 'package:flutter_application_2/profile_page.dart';
import 'package:flutter_application_2/chat_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Widget categoryItem(String title) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    margin: const EdgeInsets.only(right: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}


class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Product> bestSellingProducts = [
    Product(
      id: '1',
      name: 'Summer T-Shirt',
      price: 29.99,
      image: 'assets/images/tshirt.jpg',
      rating: 4.5,
      description: 'Comfortable cotton t-shirt for summer',
    ),
    Product(
      id: '2',
      name: 'Jeans',
      price: 49.99,
      image: 'assets/images/jeans.jpg',
      rating: 4.7,
      description: 'Stylish denim jeans',
    ),
    Product(
      id: '3',
      name: 'Shoes',
      price: 59.99,
      image: 'assets/images/shoes.jpg',
      rating: 4.6,
      description: 'Comfortable running shoes',
    ),
    Product(
      id: '4',
      name: 'Uniclo Shoes',
      price: 69.99,
      image: 'assets/images/uniqloshoes.png',
      rating: 4.8,
      description: 'Premium uniqlo sneakers',
    ),
    Product(
      id: '5',
      name: 'Watch',
      price: 89.99,
      image: 'assets/images/watch.jpg',
      rating: 4.9,
      description: 'Elegant wrist watch',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true, 
        title: const Text(
          'UNIQLO',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: badges.Badge(
              badgeContent: const Text(
                '3',
                style: TextStyle(color: Colors.white),
              ),
              child: const Icon(Icons.shopping_cart, color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                      categoryItem('T-Shirt'),
                      categoryItem('Jeans'),
                      categoryItem('Shoes'),
                      categoryItem('Uniclo Shoes'),
                      categoryItem('Watch'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Best Selling',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: bestSellingProducts.length,
                itemBuilder: (context, index) {
                  final product = bestSellingProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset(product.image, fit: BoxFit.cover),
                        ),
                        const SizedBox(height: 8),
                        Text(product.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('\$${product.price.toString()}'),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 60.0,
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.chat, size: 30, color: Colors.white),
          Icon(Icons.shopping_cart, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatListPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }
        },
      ),
    );
  }
}
