require 'rails_helper'

# rubocop:disable  Layout/LineLength
RSpec.describe Categorization, type: :model do
  describe 'associations' do
    it { should belong_to(:article) }
    it { should belong_to(:category) }
  end

  describe 'validations' do
    let(:user) { User.create!(name: 'Example User', email: 'example@user.com', password: 'password', password_confirmation: 'password') }

    let(:article) { user.articles.create!(title: 'Example Title01', text: 'Example text01', image: 'https://example.com', category_list: 'category1, category2') }

    subject { Categorization.create(article_id: article.id, category_id: 2) }
    it { should validate_uniqueness_of(:article_id).scoped_to(:category_id) }
  end
end
# rubocop:enable  Layout/LineLength
