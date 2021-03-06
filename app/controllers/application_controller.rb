class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  # deviseコントローラーにストロングパラメータを追加
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_all

  protected

  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image])
  end

  # ログイン後、rootに移動する
  def after_sign_in_path_for(resource)
    root_path
  end

  def set_all
    @all_comments = Comment.all
    @all_groups = Group.all
    @q = Group.ransack(params[:q])
  end

  def search_params
    params.require(:q).permit(:area, :text)
  end

end
