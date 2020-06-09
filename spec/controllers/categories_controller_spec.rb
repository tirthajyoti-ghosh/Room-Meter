require 'rails_helper'
require 'capybara/rspec'

RSpec.describe CategoriesController, type: :feature do
  context "categories controller actions" do
    let(:user) { User.create!(name: "Example User01", email: "example-1@user.com", password: "password", password_confirmation: "password") }

    before(:each) do      
      @category = Category.create!(name: 'Anything', priority: 5)

      @article = user.articles.create!(title: "Example Title01", text: "Example text01", image: "https://example.com", category_list: @category.name)

      visit category_path(@category)
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Login'
    end

    scenario "category show page has the category name" do
      expect(page).to have_text(@category.name)
    end

    scenario "category show page has the article title" do
      expect(page).to have_text(@article.title)
    end

    scenario "category show page has the class 'author' and it contains the author name" do
      expect(page).to have_selector('.article-body .author')
      expect(page.find('.article-body .author').text).to eq("by  #{user.name}")
    end

    scenario "category show page has the class 'text' and it contains the article text" do
      expect(page).to have_selector('.article-body .text')
      expect(page.find('.article-body .text').text).to eq(@article.text)
    end

    scenario "category show page has the class 'vote' and it contains number of votes" do
      expect(page).to have_selector('.article-body .vote')
      expect(page.find('.article-body .vote').text).to eq("0")
    end
  end
end
