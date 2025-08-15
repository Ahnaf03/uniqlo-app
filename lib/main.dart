import 'package:flutter/material.dart'; 
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; 
import 'package:badges/badges.dart'
    as badges; 
import 'login_page.dart'; 
import 'home_page.dart'; 
import 'profile_page.dart'; 
import 'chat_list_page.dart'; 
import 'chat_detail_page.dart'; 
import 'product_detail_page.dart'; 
import 'cart_page.dart'; 
import 'signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UNIQLO App', 
      debugShowCheckedModeBanner: false,

     theme: ThemeData(
                primaryColor: Colors.black,
                fontFamily: 'Poppins',
                colorScheme: ColorScheme.fromSwatch().copyWith(
                  primary: Colors.white,     
                  secondary: Colors.black,   
                ),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.black,
                  iconTheme: IconThemeData(color: Colors.white),
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),




      home: const LoginPage(),
      
    
      routes: {
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/chat-list': (context) => const ChatListPage(),
        '/chat-detail': (context) => const ChatDetailPage(),
        '/product-detail': (context) {

          final args =
            ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;

          return ProductDetailPage(product: args['product']);
        },

        '/cart': (context) => const CartPage(),
        
      },
      
      
    );
  }
}