class Record < ApplicationRecord

  belongs_to :user

  validates :sleep, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2, message: "(睡眠)無効な値が検出されました" }, on: :record_create
  validates :study, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2, message: "(勉強)無効な値が検出されました" }, on: :record_create
  validates :exercise, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2, message: "(運動)無効な値が検出されました" }, on: :record_create
  validates :diet, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2, message: "(食事)無効な値が検出されました" }, on: :record_create
  validates :habit, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2, message: "(嗜好)無効な値が検出されました" }, on: :record_create
  validates :aim, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2, message: "(目標)無効な値が検出されました" }, on: :record_create
  validates :login, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1, message: "(ログイン)無効な値が検出されました" }, on: :record_create

end
