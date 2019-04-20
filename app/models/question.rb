class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  
  # 一つでも未入力だとエラーとなる
  validates :name, presence:true
  validates :title, presence:true
  validates :content, presence:true
end

