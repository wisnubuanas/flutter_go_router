import 'package:flutter/material.dart';
import 'config/app_router.dart';
import 'screens/category_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Go Router 5.0.1",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
      // home: const CategoryScreen(),
    );
  }
}
