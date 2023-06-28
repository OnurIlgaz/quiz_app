import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget{
	const Quiz({Key? key}) : super(key: key);

	@override
	State <Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
	var activeScreen = 'start-screen';

	void switchScreen(){
		setState(() {
			activeScreen = 'questions-screen';
		});
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
						QuestionsScreen(),
					),
				),
			),
		);
	}
}