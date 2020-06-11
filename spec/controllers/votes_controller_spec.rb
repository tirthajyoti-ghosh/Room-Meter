require 'rails_helper'
require 'capybara/rspec'
# rubocop:disable  Layout/LineLength

RSpec.describe VotesController, type: :feature do
  context 'votes controller actions' do
    let(:user) { User.create!(name: 'Example User01', email: 'example-1@user.com', password: 'password', password_confirmation: 'password') }

    before(:each) do
      @category = Category.create!(name: 'Anything', priority: 5)

      @article = user.articles.create!(title: 'Example Title01', text: 'Example text01', image: 'https://example.com', category_list: @category.name)

      visit category_path(@category)
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Login'
    end

    scenario "one vote is created when user clicks link with class 'vote'" do
      page.find('.article-body .vote').click

      expect(@article.votes.count).to eq(1)
    end

    scenario 'vote link changes to p element when clicked(vote casted)' do
      page.find('.article-body .vote').click

      expect(page).to have_selector('.article-body p.voted')
      expect(page.find('.article-body p.voted').text).to eq('1')
    end
  end
end
# rubocop:enable  Layout/LineLength
