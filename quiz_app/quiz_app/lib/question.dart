class Question {
  final String text;
  final List<String> answers;
  final int correctIndex;

  const Question({
    required this.text,
    required this.answers,
    required this.correctIndex,
  });
}

const List<Question> quizQuestions = [
  Question(
    text: 'Which planet is known as the Red Planet?',
    answers: ['Venus', 'Mars', 'Jupiter', 'Saturn'],
    correctIndex: 1,
  ),
  Question(
    text: 'What is the closest star to Earth?',
    answers: ['Proxima Centauri', 'The Sun', 'Sirius', 'Betelgeuse'],
    correctIndex: 1,
  ),
  Question(
    text: 'How many moons does Earth have?',
    answers: ['0', '1', '2', '4'],
    correctIndex: 1,
  ),
  Question(
    text: 'What galaxy do we live in?',
    answers: ['Andromeda', 'Triangulum', 'Milky Way', 'Whirlpool'],
    correctIndex: 2,
  ),
  Question(
    text: 'Which planet has the most prominent ring system?',
    answers: ['Uranus', 'Neptune', 'Saturn', 'Mars'],
    correctIndex: 2,
  ),
];