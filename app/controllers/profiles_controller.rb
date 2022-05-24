# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate!
  before_action :find_profile

  def show; end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, notice: t('profile.updated')
    else
      render :edit
    end
  end

  private

  def find_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:given_name, :family_name, :email_address)
  end
end
