class Status < ApplicationRecord

  belongs_to :user

  validates :sleep, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 4095, message: "(睡眠)無効な値が検出されました" }, on: :calculate
  validates :study, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 4095, message: "(勉強)無効な値が検出されました" }, on: :calculate
  validates :exercise, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 4095, message: "(運動)無効な値が検出されました" }, on: :calculate
  validates :diet, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 4095, message: "(食事)無効な値が検出されました" }, on: :calculate
  validates :habit, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 4095, message: "(嗜好)無効な値が検出されました" }, on: :calculate
  validates :aim, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 4095, message: "(目標)無効な値が検出されました" }, on: :calculate
  validates :login, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 4095, message: "(ログイン)無効な値が検出されました" }, on: :calculate

  def self.total_point(status)
    total = status.sleep + status.study + status.exercise + status.diet + status.habit + status.aim + status.login
    return total
  end

  def self.level(status)
    total = self.total_point(status)
    level = 0
    border = 0
    while total >= border do
      level += 1
      border += level * 10
    end
    return level
  end

  def self.exp_for_level_up(status)
    total = self.total_point(status)
    level = self.level(status)
    next_level = level + 1
    next_border = 0
    while level > 0 do
      next_border +=  level * 10
      level -= 1
    end
    return next_border - total
  end

end
