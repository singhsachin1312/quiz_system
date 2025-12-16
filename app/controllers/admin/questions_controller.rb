class Admin::QuestionsController < Admin::BaseController

  def create
    quiz = Quiz.find(params[:quiz_id])
    quiz.questions.create(question_params)
    redirect_to edit_admin_quiz_path(quiz)
  end  

  private

  def question_params
    params.require(:question).permit(:content, :question_type)
  end
end
