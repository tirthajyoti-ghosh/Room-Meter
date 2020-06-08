class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name
  validates_length_of :name, minimum: 2, maximum: 30, on: :create

  has_many :articles, foreign_key: "author_id", dependent: :destroy
  has_many :votes, dependent: :destroy
end
