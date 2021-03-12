class User < ApplicationRecord
  attr_accessor :current_password

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :objectives
  has_many :troubles
  has_many :habits
  has_one  :rule

  # 存在すること・確認用を含めて2回入力はデフォルト実装のため省略 安全性を高めるために10文字以上に設定
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX }, length: { minimum: 10 }, on: :create
  validates :password, confirmation: true, on: :create

  with_options presence: true do
    validates :nickname, length: { maximum: 10 }
    validates :birthdate
    # @含むこと・存在することはdeviseのデフォルト実装のため省略
    validates :email, uniqueness: true
  end
end
