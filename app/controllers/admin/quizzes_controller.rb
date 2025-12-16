class Admin::QuizzesController < Admin::BaseController

  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.create(quiz_params)
    redirect_to edit_admin_quiz_path(@quiz)
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title)
  end
end