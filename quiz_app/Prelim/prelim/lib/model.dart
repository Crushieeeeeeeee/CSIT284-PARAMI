import 'package:flutter/material.dart';

class FoodCategory {
  final String code;
  final String name;
  final String description;
  final IconData icon;

  const FoodCategory({
    required this.code,
    required this.name,
    required this.description,
    required this.icon,
  });
}

const Map<String, FoodCategory> foodCategories = {
  'SL': FoodCategory(
    code: 'SL',
    name: 'Sweet Lover',
    description: 'You enjoy desserts and sugary treats.',
    icon: Icons.cake,
  ),
  'SF': FoodCategory(
    code: 'SF',
    name: 'Savory Fan',
    description: 'You enjoy salty and flavorful foods.',
    icon: Icons.lunch_dining,
  ),
  'SE': FoodCategory(
    code: 'SE',
    name: 'Spicy Explorer',
    description: 'You like foods with a kick.',
    icon: Icons.local_fire_department,
  ),
  'HC': FoodCategory(
    code: 'HC',
    name: 'Healthy Choice',
    description: 'You prefer lighter and healthier meals.',
    icon: Icons.eco,
  ),
};

class AnswerChoice {
  final String label;
  final String categoryCode;
  final IconData icon;

  const AnswerChoice({
    required this.label,
    required this.categoryCode,
    required this.icon,
  });
}

class QuizQuestion {
  final String questionText;
  final List<AnswerChoice> choices;

  const QuizQuestion({required this.questionText, required this.choices});
}

const List<QuizQuestion> quizQuestions = [
  QuizQuestion(
    questionText: 'What flavor do you enjoy most?',
    choices: [
      AnswerChoice(label: 'Sweet', categoryCode: 'SL', icon: Icons.icecream),
      AnswerChoice(label: 'Salty', categoryCode: 'SF', icon: Icons.restaurant),
      AnswerChoice(
          label: 'Spicy',
          categoryCode: 'SE',
          icon: Icons.local_fire_department),
      AnswerChoice(label: 'Sour', categoryCode: 'SF', icon: Icons.emoji_food_beverage),
    ],
  ),
  QuizQuestion(
    questionText: 'Which snack would you choose?',
    choices: [
      AnswerChoice(label: 'Cake', categoryCode: 'SL', icon: Icons.cake),
      AnswerChoice(label: 'Fries', categoryCode: 'SF', icon: Icons.fastfood),
      AnswerChoice(label: 'Nachos', categoryCode: 'SF', icon: Icons.dinner_dining),
      AnswerChoice(label: 'Fruit', categoryCode: 'HC', icon: Icons.apple),
    ],
  ),
  QuizQuestion(
    questionText: 'What would you most likely order at a restaurant?',
    choices: [
      AnswerChoice(label: 'Dessert', categoryCode: 'SL', icon: Icons.bakery_dining),
      AnswerChoice(label: 'Burger', categoryCode: 'SF', icon: Icons.lunch_dining),
      AnswerChoice(
          label: 'Chicken Wings',
          categoryCode: 'SE',
          icon: Icons.set_meal),
      AnswerChoice(label: 'Salad', categoryCode: 'HC', icon: Icons.eco),
    ],
  ),
];