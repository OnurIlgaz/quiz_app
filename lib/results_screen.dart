import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'data/questions.dart';

class ResultsScreen extends StatelessWidget{
 	const ResultsScreen(this.selectedAnswers, this.switchScreen, {super.key});
	
	final List<String> selectedAnswers;
	final void Function() switchScreen;

	List<Map<String, Object>> getSummaryData(){
		List<Map<String, Object>> summary = [];
		int index = 0;

		for(QuizQuestion question in questions){
			summary.add({
				'question-index' : index + 1,
				'question' : question.question,
				'correct-answer' : question.answers[0],
				'user-answer' : selectedAnswers[index],
			});
			index++;
		}

		return summary;
	}

	@override
	Widget build(context){
		final summaryData = getSummaryData();
		int correctAnswerCount = 0;

		for(int i = 0; i < questions.length; i++){
			if(selectedAnswers[i] == questions[i].answers[0]){
				correctAnswerCount++;
			}
		}

		return Column(
			mainAxisSize: MainAxisSize.min,
			children: [
				Text(
					"You answered ${correctAnswerCount} out of ${questions.length} questions correctly!",
					style: GoogleFonts.lato(
						color: Colors.white,
						fontSize: 30,
					),
					maxLines: 2,
					textAlign: TextAlign.center,
				),
				SizedBox(
					height: 10,
				),
				Container(
					height: MediaQuery.of(context).size.height * 3 / 5,
					child: ListView(
						children: [
							...summaryData.map(
								(data){
									return AnsweredQuestionView(data);
								}
							),
						],
					),
				),
				TextButton.icon(
					onPressed: switchScreen, 
					icon: Icon(Icons.restart_alt),
					label: Text("Restart Quiz!"),
				)
			],
		);
	}
}

class AnsweredQuestionView extends StatelessWidget{
	const AnsweredQuestionView(this.summary, {super.key});
	final Map<String, Object> summary;

	@override
	Widget build(context){
		return 
		Container(
			margin: EdgeInsets.only(left: 20, right: 40),
			child: Row(
				mainAxisSize: MainAxisSize.min,
				children: [
					Container(
						width: 30,
						height: 30,
						decoration: BoxDecoration(
							shape: BoxShape.circle,
							color: summary['correct-answer'] == summary['user-answer']?
								Colors.blue[300] :
								Colors.red[300],
						),
						child: Center(
							child: Text(
								summary['question-index'].toString(),
							),
						),
					),
					Expanded(
						child: Column(
							children: [
								Text(
									maxLines: 2,
									textAlign: TextAlign.center,
									summary['question']!.toString(),
									style: TextStyle(
										color: Colors.white,
										fontSize: 15,
									)
								),
								Text(
									maxLines: 2,
									textAlign: TextAlign.center,
									summary['correct-answer']!.toString(),
									style: TextStyle(
										color: Color.fromARGB(255, 84, 81, 93),
									)
								),
								Text(
									maxLines: 2,
									textAlign: TextAlign.center,
									summary['user-answer']!.toString(),
									style: TextStyle(
										color: Color.fromARGB(255, 63, 161, 197),
									)
								)
							],
						),
					)
				]
			),
		);
	}
}