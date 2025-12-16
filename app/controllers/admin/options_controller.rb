class Admin::OptionsController < ApplicationController

  def create
    question = Question.find(params[:question_id])
    question.options.create(option_params)
    redirect_to fallback_location: edit_admin_quiz_path(question.quiz)
  end

  private

  def option_params
    params.require(:option).permit(:content, :correct)
  end
end
