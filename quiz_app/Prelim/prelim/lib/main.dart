import 'package:flutter/material.dart';
import 'welcome_screen.dart';

void main() => runApp(const FavoriteFoodFinderApp());

class FavoriteFoodFinderApp extends StatelessWidget {
  const FavoriteFoodFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite Food Finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE85D26)),
        scaffoldBackgroundColor: const Color(0xFFFFF8F2),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE85D26),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 52),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}