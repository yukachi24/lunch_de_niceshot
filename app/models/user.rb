class User < ApplicationRecord
  # Devise モジュール
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ★ Round とのアソシエーション追加
  has_many :rounds, dependent: :destroy
end
