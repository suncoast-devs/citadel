# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def authenticate!
    unless signed_in?
      redirect_to new_session_path,
                  alert: {
                    title: 'Authentication Required',
                    body: 'You must be signed in before accessing that page.',
                  }
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue StandardError
    session[:user_id] = nil
  end

  helper_method :current_user

  def signed_in?
    !current_user.nil?
  end

  helper_method :signed_in?
end
