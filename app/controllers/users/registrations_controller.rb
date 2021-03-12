# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # 更新時にパスワードを不要とする
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def configure_sign_up_params
    # 新規登録時にニックネーム,生年月日の取得を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthdate])
  end

  def configure_account_update_params
    # 情報更新時にニックネーム,生年月日の取得を許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :birthdate])
  end

  # 更新後は習慣カウントページへ遷移
  def after_update_path_for(_resource)
    habits_path
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
