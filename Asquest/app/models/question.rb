class Question < ApplicationRecord
  # 一つでも未入力だとエラーとなる
  validates :name, presence:true
  validates :title, presence:true
  validates :content, presence:true
end

