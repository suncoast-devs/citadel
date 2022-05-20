# frozen_string_literal: true
class SessionsController < ApplicationController
  def new; end

  def create
    user = Authorization.from_hash(request.env['omniauth.auth'])&.user

    if user
      session[:user_id] = user.id
      redirect_to :root
    else
      redirect_to new_session_path,
                  alert: {
                    title: 'Authentication Failed',
                    body: 'You must be invited in before signing in.',
                  }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end
