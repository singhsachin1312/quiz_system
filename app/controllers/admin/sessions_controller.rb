class Admin::SessionsController < ApplicationController

  def new
  end

  def create
    admin = Admin.find_by(email: params[:email])
    if admin.present?
      if admin.authenticate(params[:password])
        session[:admin_id] = admin.id
        redirect_to admin_quizzes_path
      else
        flash[:alert] = "Invalid credentials"
        render :new
      end
    else
      flash[:alert] = "Account not exist!"
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to admin_login_path
  end
end