require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe "associations" do
    it { should belong_to(:article) }
    it { should belong_to(:user) }
  end

  describe "validations" do
    let(:user) { User.create!(name: "Example User", email: "example@user.com", password: "password", password_confirmation: "password") }

    let(:article) { user.articles.create!(title: "Example Title01", text: "Example text01", image: "https://example.com", category_list: "category1, category2") }

    subject { Vote.create(article_id: article.id, user_id: user.id) }
    it { should validate_uniqueness_of(:user_id).scoped_to(:article_id) }
  end
end
