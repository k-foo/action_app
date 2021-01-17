class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :objectives

  with_options presence: true do
    validates :nickname, uniqueness: true, length: { maximum: 15 }
    validates :birthdate
    # @含むこと・存在することはdeviseのデフォルト実装のため省略
    validates :email, uniqueness: true
    # 存在すること・確認用を含めて2回入力・6字以上はdeviseのデフォルト実装のため省略
    # パスワードが半角英数字（空文字NG）以外の場合には、メッセージを出す
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
  end
end
