class QuizzesController < ApplicationController
   
  def show
    @quiz = Quiz.find(params[:id])
  end 

  def submit
    quiz = Quiz.find(params[:id])
    attempt = quiz.attempts.create(score: 0)
    score = 0

    params[:answers].each do  |qid, oid|
      option = Option.find(oid)
      attempt.answers.create(question_id: qid, option_id: oid)
      score +=1 if option.correct?
    end

    attempt.update(score: score)
    redirect_to result_quiz_path(attempt)
  end

  def result
    @attempt = Attempt.find(params[:id])
  end
end
