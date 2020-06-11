class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :votes, dependent: :destroy

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  validates_presence_of :title
  validates_presence_of :text
  validates_presence_of :image
  validates_length_of :title, minimum: 5, maximum: 50
  validates_length_of :text, minimum: 10, maximum: 35_000
  validates :image, url: { public_suffix: true, message: 'does not have a valid URL' }

  default_scope -> { order(created_at: :desc) }

  def category_list=(category_string)
    category_names = category_string.split(',').collect { |s| s.strip.capitalize }.uniq
    new_or_found_categories = category_names.collect { |name| Category.find_or_create_by(name: name) }
    self.categories = new_or_found_categories
  end

  def self.already_voted?(article, user_id)
    Vote.exists?(user_id: user_id, article_id: article.id)
  end
end
