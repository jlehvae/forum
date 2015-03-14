class SessionsController < ApplicationController
  def create_oauth
    login = env["omniauth.auth"]["extra"]["raw_info"]["login"]

    if login
      user = User.find_by username: login

      if user
        session[:user_id] = user.id
        redirect_to user_path(user), notice: "Welcome back!"
      else
        newUser = User.new(username: login)
        newUser.save()
        session[:user_id] = newUser.id
        redirect_to :root, notice: "Thank you for registering!"
      end
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to :root
  end
end
