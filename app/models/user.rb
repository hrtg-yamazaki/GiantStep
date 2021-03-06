class User < ApplicationRecord

  has_one :status, dependent: :destroy
  has_one :yardstick, dependent: :destroy
  has_many :records, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :validatable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  VALID_EMAIL_REGIX    = /\A[^@\s]+@[^@\s]+\z/
  VALID_PASSWORD_REGIX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i
  VALID_PRIVACY_REGIX = /on_(public|private)/
  
  validates :email,    presence: { message: "メールアドレス を入力してください" }, on: :keep, format: { with: VALID_EMAIL_REGIX, message: "フォーマットが不適切です"}
  validates :password, presence: { message: "パスワード を入力してください" }, on: :keep, length: { maximum: 128, message: "128文字以下で入力してください" }, format: { with: VALID_PASSWORD_REGIX, message: "英字と数字両方を含むパスワードを入力してください" }, confirmation: { message: 'パスワードが一致しません'}
  validates :password_confirmation, presence: { message: '確認用にパスワードを入力してください' }, on: :keep

  validates :nickname,       presence: { message: "ニックネーム を入力してください" },   on: [:user_create, :profile_update], length: { maximum: 20, message: "20文字以下で入力してください" }
  validates :privacy, presence: { message: "公開設定が選択されていません" }, on: [:user_create, :profile_update], format: { with: VALID_PRIVACY_REGIX, message: "(公開設定)無効な値が検出されました" }
  validates :birthday, presence: { message: "生年月日 を入力してください" }, on: :user_create
  validates :profile, length: { maximum: 1000, message: "1000文字以下で入力してください" }, on: [:user_create, :profile_update]

  enum gender: [ :not_public, :male, :female ]
  enum privacy: [ :on_public, :on_private ]

  mount_uploader :icon, ImageUploader

end
