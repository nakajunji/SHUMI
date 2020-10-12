class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(_resource)
    if current_user
      flash[:notice] = 'ログインしました！'
      user_path(current_user) # ログイン後にマイページに遷移
    end
  end

  def after_sign_out_path_for(_resource)
    flash[:notice] = 'ログアウトしました！'
    root_path # ログアウト後にトップ画面に遷移
  end

end
