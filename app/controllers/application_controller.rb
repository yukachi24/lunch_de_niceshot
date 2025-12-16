class ApplicationController < ActionController::Base

  # ▼ Devise：ログイン後の遷移先
  # ログイン後はマイページ（TOP）へ
  def after_sign_in_path_for(resource)
    authenticated_root_path
  end

  # ▼ 存在しないレコードへのアクセス対策
  # ・削除済みのラウンドURLを直打ちした場合
  # ・他ユーザーのIDを指定された場合
  # などに発生する RecordNotFound を捕まえる
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_not_found

  protected

  # ▼ RecordNotFound 時の共通処理
  def redirect_not_found
    redirect_to root_path, alert: "該当するデータは見つかりませんでした"
  end
end
