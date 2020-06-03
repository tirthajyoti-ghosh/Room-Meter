class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :votes, dependent: :destroy

  validates :title, presence: true, length: {maximum: 50}
  validates :text, presence: true, length: {maximum: 1000}    

  default_scope -> { order(created_at: :desc) }
end
