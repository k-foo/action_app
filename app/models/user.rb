class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :objectives
  has_many :troubles
  has_many :habits

  with_options presence: true do
    validates :nickname, uniqueness: true, length: { maximum: 15 }
    validates :birthdate
    # @含むこと・存在することはdeviseのデフォルト実装のため省略
    validates :email, uniqueness: true
    # 存在すること・確認用を含めて2回入力はデフォルト実装のため省略 安全性を高めるために15文字以上に設定
    validates :password, length: { minimum: 15 }
    # パスワードが半角英数字（空文字NG）以外の場合には、メッセージを出す
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: '半角英数字で入力してください'
  end
end
