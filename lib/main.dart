import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';


void main() {
  runApp( ECommerceApp());
}


class ECommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        
      },
    );
  }
}