class Admin::OptionsController < ApplicationController

  def create
    question = Question.find(params[:question_id])
    question.options.create(option_params)
    redirect_to ""
  end

  private
  
  def option_params
    params.require(:option).permit(:content, :correct)
  end
end
