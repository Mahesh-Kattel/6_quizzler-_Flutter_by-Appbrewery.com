import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizbrain.dart';

QuizBrain quizbrain = QuizBrain();

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> scoreKeeper = [];
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizbrain.getCorrectAnswer();

    setState(() {
      if (quizbrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'End!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizbrain.reset();

        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(
            const Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizbrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  quizbrain.questionText(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CupertinoButton(
                    color: Colors.greenAccent,
                    onPressed: () {
                      //   bool correctAnswer = quizbrain.getCorrectAnswer();
                      //   if (correctAnswer == true) {
                      //     print("boom");
                      //     scoreKeeper.add(const Icon(Icons.check_box));
                      //   } else {
                      //     scoreKeeper.add(const Icon(Icons.close));
                      //     print("seet");
                      //   }
                      //   setState(() {
                      //     checkAnswer();
                      //     quizbrain.isFinished();
                      //     quizbrain.nextQuestion();
                      //   });
                      checkAnswer(true);
                    },
                    child: const Text("YES")),
                const SizedBox(height: 20),
                CupertinoButton(
                    color: Colors.red,
                    onPressed: () {
                      // bool correctAnswer = quizbrain.getCorrectAnswer();
                      // if (correctAnswer == false) {
                      //   print("boom");
                      //   scoreKeeper.add(const Icon(Icons.check_box));
                      // } else {
                      //   print("seet");
                      //   scoreKeeper.add(const Icon(Icons.close));
                      // }
                      // setState(() {
                      //   quizbrain.isFinished();
                      //   quizbrain.nextQuestion();
                      // });
                      checkAnswer(false);
                    },
                    child: const Text("NO")),
              ],
            )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: scoreKeeper,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
