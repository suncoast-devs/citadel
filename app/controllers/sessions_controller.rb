# frozen_string_literal: true
class SessionsController < ApplicationController
  def new; end

  def create
    auth = Authorization.from_hash(request.env['omniauth.auth'])
    token = request.env.dig('omniauth.params', 'invite')

    return sign_in_with(auth.user) if auth.present?
    return redeem_invitation(token) if token.present?
    return additional_provider if signed_in?

    redirect_to :new_session, alert: t('authentication.failed')
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root, notice: t('authentication.signed_out')
  end

  private

  def additional_provider
    create_authorization(current_user)
    redirect_to :dashboard # TODO: profile path
  end

  def create_authorization(user)
    user.authorizations.create!(request.env['omniauth.auth'].slice(:uid, :provider).to_h)
  end

  def redeem_invitation(token)
    ActiveRecord::Base.transaction do
      invitation = Invitation.find_by(token: token)
      invitation.redeem!

      create_authorization(invitation.user)
      sign_in_with(invitation.user)
    end
  end

  def sign_in_with(user)
    session[:user_id] = user.id
    redirect_to :dashboard,
                notice: {
                  title: t('authentication.signed_in.title', name: current_user.profile.given_name),
                  body: t('authentication.signed_in.body'),
                }
  end
end
