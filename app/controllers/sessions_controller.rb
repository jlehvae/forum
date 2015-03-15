class SessionsController < ApplicationController
  def create_oauth
    login = env["omniauth.auth"]["extra"]["raw_info"]["login"]
    avatar = env["omniauth.auth"]["extra"]["raw_info"]["avatar_url"]

    if login
      user = User.find_by username: login

      if user
        session[:user_id] = user.id
        if user.avatar != avatar
          user.avatar = avatar
          user.save()
        end
        redirect_to :root, notice: "Welcome back!"
      else
        newUser = User.new(username: login, avatar: avatar)
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
