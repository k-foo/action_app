class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  # イフゼンルールが未設定であれば設定ページへ遷移し、設定済であれば習慣カウントページへ遷移する
  def after_sign_in_path_for(resource)
    @rule = Rule.find_by(user_id: resource.id)
    if @rule.nil?
      rules_path(resource)
    else
      habits_path(resource)
    end
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthdate])
  end
end
