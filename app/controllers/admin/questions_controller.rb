class Admin::QuestionsController < ApplicationController
  def create
    quiz = Quiz.find(params[:quiz_id])
    question = quiz.questions.create!(question_params)

    # ONLY boolean questions auto-create options
    if question.boolean?
      correct_value = params[:correct_boolean]
      raise "Correct answer required" if correct_value.blank?

      question.options.create!([
        { content: "true",  correct: correct_value == "true" },
        { content: "false", correct: correct_value == "false" }
      ])
    end

    redirect_to edit_admin_quiz_path(quiz)
  end

  private

  def question_params
    params.require(:question).permit(:content, :question_type)
  end
end
