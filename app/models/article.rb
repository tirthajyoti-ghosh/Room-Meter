class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
end
