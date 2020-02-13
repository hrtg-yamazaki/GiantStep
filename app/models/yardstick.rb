class Yardstick < ApplicationRecord

  belongs_to :user

  validates :sleep, presence: { message: "睡眠に関する採点基準 を入力してください" }, length: { maximum: 511, message: "511文字以下で入力してください" }, on: :yardstick_update
  validates :study, presence: { message: "勉強に関する採点基準 を入力してください" }, length: { maximum: 511, message: "511文字以下で入力してください" }, on: :yardstick_update
  validates :exercise, presence: { message: "運動に関する採点基準 を入力してください" }, length: { maximum: 511, message: "511文字以下で入力してください" }, on: :yardstick_update
  validates :diet, presence: { message: "食事に関する採点基準 を入力してください" }, length: { maximum: 511, message: "511文字以下で入力してください" }, on: :yardstick_update
  validates :habit, presence: { message: "嗜好品に関する採点基準 を入力してください" }, length: { maximum: 511, message: "511文字以下で入力してください" }, on: :yardstick_update
  validates :aim, presence: { message: "目標に関する採点基準 を入力してください" }, length: { maximum: 511, message: "511文字以下で入力してください" }, on: :yardstick_update

end
