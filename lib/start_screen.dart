import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  	const StartScreen(this.changePage ,{super.key});

	final void Function() changePage;

	@override
	Widget build(context){
		return Column(
			mainAxisSize: MainAxisSize.min,
			children: [
				Image.asset(
					'assets/quiz-logo.png', 
					width: 200,
					color: const Color.fromARGB(150, 255, 255, 255),
				),
				const SizedBox(
					height: 30,
					width: 20,
				),
				Text(
					"Learn Flutter the fun way!",
					style: GoogleFonts.lato(
						color: const Color.fromARGB(255, 255, 255, 255),
						fontSize: 20,
					),
				),
				const SizedBox(
					height: 30,
					width: 20,
				),
				OutlinedButton.icon(
					onPressed: changePage,
					style: OutlinedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 37, 5, 97), foregroundColor: Colors.white),
					icon: const Icon(Icons.arrow_right_alt),
					label: const Text("Start Quiz"),
				),
			],
		);
	}
}