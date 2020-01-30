class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :validatable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  VALID_EMAIL_REGIX    = /\A[^@\s]+@[^@\s]+\z/
  VALID_PASSWORD_REGIX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i
  
  validates :nickname, presence: { message: "ニックネーム を入力してください" }, on: :keep, length: { maximum: 20, message: "20文字以下で入力してください" }
  validates :email,    presence: { message: "メールアドレス を入力してください" }, on: :keep, format: { with: VALID_EMAIL_REGIX,   message: "フォーマットが不適切です"}
  validates :password, presence: { message: "パスワード を入力してください" }, on: :keep, length: { maximum: 128, message: "128文字以下で入力してください" }, format: { with: VALID_PASSWORD_REGIX, message: "英字と数字両方を含むパスワードを入力してください" }, confirmation: { message: 'パスワードが一致しません'}
  validates :password_confirmation, presence: { message: '確認用にパスワードを入力してください' }, on: :keep

  enum gender: [ :not_public, :male, :female ]

end
