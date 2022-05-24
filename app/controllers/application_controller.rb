# frozen_string_literal: true

class ApplicationController < ActionController::Base
  default_form_builder Citadel::FormBuilder

  def authenticate!
    return if signed_in?
    redirect_to :new_session, alert: t('authentication.required')
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
