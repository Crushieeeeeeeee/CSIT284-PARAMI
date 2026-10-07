import 'package:flutter/material.dart';
import '../models/question.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedIndex;

  static const _mellowPurple = Color(0xFF8E7CC3);
  static const _mellowPink = Color(0xFFD9B8D4);

  void _selectAnswer(int index) {
    if (_selectedIndex != null) return; // lock after first tap

    setState(() {
      _selectedIndex = index;
      if (index == quizQuestion[_currentIndex].correctIndex) {
        _score++;
      }
    });

    Future.delayed(const Duration(milliseconds: 600), _goToNext);
  }

  void _goToNext() {
    if (_currentIndex < quizQuestions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedIndex = null;
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            score: _score,
            total: quizQuestion.length,
            onRestart: _restartQuiz,
          ),
        ),
      );
    }
  }

  void _restartQuiz() {
    setState(() {
      _currentIndex = 0;
      _score = 0;
      _selectedIndex = null;
    });
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  Color _buttonColor(int index) {
    final question = quizQuestion[_currentIndex];
    if (_selectedIndex == null) return Colors.white;
    if (index == question.correctIndex) return Colors.green.shade200;
    if (index == _selectedIndex) return Colors.red.shade200;
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final question = quizQuestions[_currentIndex];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              Center(
                child: Image.asset('assets/images/logo.png', height: 90),
              ),
              const SizedBox(height: 24),
              Text(
                'Question ${_currentIndex + 1} of ${quizQuestion.length}',
                style: TextStyle(
                  color: _mellowPurple,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                question.text,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A4468),
                ),
              ),
              const SizedBox(height: 32),
              ...List.generate(question.answers.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ElevatedButton(
                    onPressed: () => _selectAnswer(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _buttonColor(index),
                      foregroundColor: const Color(0xFF4A4468),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: BorderSide(color: _mellowPink, width: 1.2),
                      ),
                    ),
                    child: Text(question.answers[index]),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}