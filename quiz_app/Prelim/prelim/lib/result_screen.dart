import 'package:flutter/material.dart';
import 'model.dart';
import 'welcome_screen.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, int> categoryScores;
  final List<String> selectedLabels;

  const ResultScreen({
    super.key,
    required this.categoryScores,
    required this.selectedLabels,
  });

  String _findWinningCategoryCode() {
    String winningCode = categoryScores.keys.first;
    int highestScore = -1;

    categoryScores.forEach((code, score) {
      if (score > highestScore) {
        highestScore = score;
        winningCode = code;
      }
    });

    return winningCode;
  }

  void _tryAgain(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final FoodCategory result = foodCategories[_findWinningCategoryCode()]!;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Your Recommended Food Type',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Color(0xFF7A6A5F)),
              ),
              const SizedBox(height: 24),
              Center(
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFE0CC),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(result.icon,
                      size: 90, color: const Color(0xFFE85D26)),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'Recommended Category:\n${result.name}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D2B1F),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                result.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 17, color: Color(0xFF7A6A5F)),
              ),
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFE5DCD4), width: 2),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Answers',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3D2B1F),
                      ),
                    ),
                    const SizedBox(height: 10),
                    for (int i = 0; i < selectedLabels.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          'Question ${i + 1}:  ${selectedLabels[i]}',
                          style: const TextStyle(
                              fontSize: 15, color: Color(0xFF7A6A5F)),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => _tryAgain(context),
                child: const Text('Try Again'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}