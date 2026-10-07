import 'package:flutter/material.dart';
import 'question_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _startQuiz(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QuestionScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFE0CC),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.restaurant_menu,
                  size: 82,
                  color: Color.fromARGB(255, 22, 24, 172),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Favorite Food Finder',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D2B1F),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Answer three questions and discover a food '
                'that matches your preferences.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Color(0xFF7A6A5F)),
              ),
              const SizedBox(height: 44),
              ElevatedButton(
                onPressed: () => _startQuiz(context),
                child: const Text('Start'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}