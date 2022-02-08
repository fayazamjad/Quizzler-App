import 'questions.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionbank = [
    Question(q: 'This app is developed by Fayaz Ahmed', a: true),
    Question(q: 'Java is object oriented programming language', a: true),
    Question(q: 'flutter don\'t suport dart language', a: false)
  ];
  void nextQuestion() {
    if (_questionNumber < _questionbank.length - 1) {
      _questionNumber++;
    }
  }

  bool finished() {
    if (_questionNumber >= _questionbank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  String getQuestionText() {
    return _questionbank[_questionNumber].questiontext;
  }

  bool getQuestionAnswer() {
    return _questionbank[_questionNumber].questionanswer;
  }
}
