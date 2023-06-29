import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget{
	const QuestionsScreen(this.onSelectAnswer, {super.key});

	final void Function(String select) onSelectAnswer;

	@override
	State<StatefulWidget> createState() {
		return _QuestionsState();
	}
}

class _QuestionsState extends State<QuestionsScreen>{
	int questionIndex = 0;

	void onTap(String selectedAnswer){
		widget.onSelectAnswer(selectedAnswer);
		setState(() {
			questionIndex++;
		});
	}

 	@override
	Widget build(BuildContext context) {
		final currentQuestion = questions[questionIndex];
		return 
		Container(
			margin: EdgeInsets.all(30),
			child: Column(
				mainAxisSize: MainAxisSize.min,
				crossAxisAlignment: CrossAxisAlignment.stretch,
				children: [
					Text(
						textAlign: TextAlign.center,
						currentQuestion.question,
						style: GoogleFonts.lato(
							fontSize: 23,
							fontWeight: FontWeight.bold,
							color: Color.fromARGB(255, 121, 132, 198),
						),
					),
					SizedBox(
						height: 30,
						width: 10,
					),
					...currentQuestion.shuffledAnswers.map((answer) => Choice(answer, () {
						onTap(answer);
					})),
				],
			),
		);	
	}
}

class Choice extends StatelessWidget{
	const Choice(this.answer, this.onTap, {super.key});

	final String answer;
	final void Function() onTap;

	@override
	Widget build(context){
		return 
		Padding(
			padding: const EdgeInsets.only(top:20),
			child: ElevatedButton(
				style: ElevatedButton.styleFrom(
					padding: EdgeInsets.all(18),
					backgroundColor: const Color.fromARGB(255, 55, 9, 102),
					foregroundColor: Colors.white,
					shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
				),
				onPressed: onTap,
				child: Text(
					answer,
					textAlign: TextAlign.center,
				),
			)
		);
	}
}