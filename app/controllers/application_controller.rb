class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_user!

	protected

	def after_sign_in_path_for(resource)
		flash[:notice] = "ログインしました！"
		user_path(current_user) # ログイン後にマイページに遷移
  	end

  	def after_sign_out_path_for(resource)
  		flash[:notice] = "ログアウトしました！"
  		root_path # ログアウト後にトップ画面に遷移
  	end

	def configure_permitted_parameters
	end
end
