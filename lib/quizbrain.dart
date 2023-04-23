import 'package:quizleer/questions.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Qusstions> _questionBank = [
    Qusstions(q: 'Is Charles Babbage Father of Modern Computer?', a: true),
    Qusstions(q: 'Are you Handsome?', a: true),
    Qusstions(q: 'Are you Mad?', a: false)
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String questionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].answersAnswer;
  }

  bool isFinished() {
    if (_questionNumber == _questionBank.length - 1) {
      print(_questionBank.length - 1);
      print('Now returning true');
      return true;
    } else {
      print(_questionBank.length - 2);
      print('Now Returning False');
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
