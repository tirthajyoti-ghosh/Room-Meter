class Category < ApplicationRecord
  has_many :categorizations, dependent: :destroy
  has_many :articles, through: :categorizations

  default_scope -> { order(priority: :desc) }

  validates :name, uniqueness: { case_sensitive: false }
end
