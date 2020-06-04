class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :votes, dependent: :destroy

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  validates :title, presence: true, length: {maximum: 50}
  validates :text, presence: true, length: {maximum: 1000}    

  default_scope -> { order(created_at: :desc) }

  def category_list=(category_string)
    category_names = category_string.split(",").collect{|s| s.strip.capitalize}.uniq
    new_or_found_categories = category_names.collect { |name| Category.find_or_create_by(name: name) }
    self.categories = new_or_found_categories
  end
end
