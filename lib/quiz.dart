import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget{
	const Quiz({Key? key}) : super(key: key);

	@override
	State <Quiz> createState() => _QuizState();
}

//* aslında burdan başlıyor:
class _QuizState extends State<Quiz> {
	List <String> selectedAnswers = [];
	var activeScreen = 'start-screen';

	void switchScreen(){
		setState(() {
			if(activeScreen == 'start-screen'){
				activeScreen = 'questions-screen';
			}
			else if(activeScreen == 'questions-screen'){
				activeScreen = 'results-screen';
			}
			else{
				activeScreen = 'start-screen';
				selectedAnswers = [];
			}
		});
	}

	void chooseAnswer(String answer) {
		selectedAnswers.add(answer);
		if (selectedAnswers.length == questions.length){
			switchScreen();
		}
	}

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				body: Container(
					decoration: const BoxDecoration(gradient: LinearGradient(
						colors:[Color.fromARGB(255, 15, 10, 78), Color.fromARGB(255, 15, 79, 162)],
					)),
					child: Center(
						child: activeScreen == 'start-screen' ? 
						StartScreen(switchScreen) : 
						activeScreen == 'questions-screen' ?
						QuestionsScreen(chooseAnswer):
						ResultsScreen(selectedAnswers, switchScreen)
					),
				),
			),
		);
	}
}