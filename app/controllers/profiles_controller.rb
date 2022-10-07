class ProfilesController < ApplicationController
  before_action :set_id, only: [:show, :edit, :update, :destroy]
  def index
    @profiles = Profile.all
  end

  def show
    # @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to @profile
    else
      render :new
    end
  end

  def edit
    # @profile = Profile.find(params[:id])
  end

  def update
    # @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit
    end
  end

  def destroy
    # @profile = Profile.find(params[:id])
    @profile.destroy
  end

  private
  def profile_params
    params.require(:profile).permit(:first_name,:last_name,:gender,:age,:house_no,:street,:city,:state,:country,:zipcode)
  end

  def set_id
  @profile = Profile.find(params[:id])
  end

end
