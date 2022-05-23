# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    redirect_to :dashboard if signed_in?
  end

  def invite
    @invitation = Invitation.find_by(token: params[:token])
    redirect_to :root, alert: t('authentication.invalid_token') if @invitation&.redeemed?
  end
end
