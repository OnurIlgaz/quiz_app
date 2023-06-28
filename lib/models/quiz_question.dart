class QuizQuestion{
	const QuizQuestion(this.question, this.answers);

	final String question;
	final List<String> answers;

	List<String> get shuffledAnswers => List.of(answers)..shuffle();

}