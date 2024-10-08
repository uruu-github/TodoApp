class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prof, only: [:edit, :update]

  def show
    @profile = current_user.profile
  end

  def edit
  end

  def update
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'プロフィールを更新しました。'
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(
      :nickname,
      :introduction,
      :gender,
      :birthday,
      :subscribed,
      :avatar
    )
  end

  def set_prof
    @profile = current_user.profile || current_user.build_profile
  end

end
