class QuizzesController < ApplicationController
  
  def index
    @quizzes = Quiz.where(published: true)
  end
  
  def show
    @quiz = Quiz.find(params[:id])
  end 

  def submit
  quiz = Quiz.find(params[:id])
  attempt = quiz.attempts.create!(score: 0)

  score = 0

  # MCQ answers
  if params[:answers]
    params[:answers].each do |question_id, option_id|
      option = Option.find(option_id)
      attempt.answers.create!(
        question_id: question_id,
        option_id: option_id
      )
      score += 1 if option.correct?
    end
  end

  # Text answers (no auto scoring)
  if params[:text_answers]
    params[:text_answers].each do |question_id, text|
      attempt.answers.create!(
        question_id: question_id,
        text_answer: text
      )
    end
  end

  # Boolean answers (optional scoring)
  if params[:boolean_answers]
    params[:boolean_answers].each do |question_id, value|
      correct_option = Option.find_by(
        question_id: question_id,
        correct: true
      )

      attempt.answers.create!(
        question_id: question_id,
        text_answer: value
      )

      score += 1 if correct_option&.content == value
    end
  end

  attempt.update!(score: score)
  redirect_to result_quiz_path(attempt)
end


  def result
    @attempt = Attempt.find(params[:id])
  end
end
