import 'package:flutter/material.dart';
import 'model.dart';
import 'result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  int? selectedChoiceIndex;

  final Map<String, int> categoryScores = {'SL': 0, 'SF': 0, 'SE': 0, 'HC': 0};
  final List<String> selectedLabels = [];

  void _goToNextQuestion() {
    if (selectedChoiceIndex == null) return;

    final AnswerChoice picked =
        quizQuestions[currentQuestionIndex].choices[selectedChoiceIndex!];

    categoryScores[picked.categoryCode] =
        categoryScores[picked.categoryCode]! + 1;
    selectedLabels.add(picked.label);

    final bool isLastQuestion =
        currentQuestionIndex == quizQuestions.length - 1;

    if (isLastQuestion) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            categoryScores: Map<String, int>.from(categoryScores),
            selectedLabels: List<String>.from(selectedLabels),
          ),
        ),
      );
    } else {
      setState(() {
        currentQuestionIndex++;
        selectedChoiceIndex = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestion question = quizQuestions[currentQuestionIndex];
    final bool isLastQuestion =
        currentQuestionIndex == quizQuestions.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Food Finder'),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question ${currentQuestionIndex + 1} of ${quizQuestions.length}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFE85D26),
                ),
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: (currentQuestionIndex + 1) / quizQuestions.length,
                  minHeight: 8,
                  backgroundColor: const Color(0xFFFFE0CC),
                  color: const Color(0xFFE85D26),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                question.questionText,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D2B1F),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: question.choices.length,
                  itemBuilder: (context, index) {
                    final AnswerChoice choice = question.choices[index];
                    final bool isSelected = selectedChoiceIndex == index;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () =>
                            setState(() => selectedChoiceIndex = index),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 16),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFFFE0CC)
                                : Colors.white,
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFFE85D26)
                                  : const Color(0xFFE5DCD4),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                choice.icon,
                                size: 30,
                                color: isSelected
                                    ? const Color(0xFFE85D26)
                                    : const Color(0xFF7A6A5F),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  choice.label,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: const Color(0xFF3D2B1F),
                                  ),
                                ),
                              ),
                              if (isSelected)
                                const Icon(Icons.check_circle,
                                    color: Color(0xFFE85D26)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: selectedChoiceIndex == null ? null : _goToNextQuestion,
                child: Text(isLastQuestion ? 'See Result' : 'Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}