require 'rails_helper'
require 'capybara/rspec'
# rubocop:disable  Metrics/BlockLength
# rubocop:disable  Layout/LineLength

RSpec.describe ArticlesController, type: :feature do
  context 'articles controller actions' do
    let(:user) { User.create!(name: 'Example User01', email: 'example-1@user.com', password: 'password', password_confirmation: 'password') }

    let(:category) { Category.create!(name: 'Anything', priority: 5) }

    let(:article1) { user.articles.create!(title: 'Example Title01', text: 'Example text01', image: 'https://example.com', category_list: 'Anything') }

    let(:article2) { user.articles.create!(title: 'Example Title02', text: 'Example text02', image: 'https://example.com', category_list: 'category2') }

    before(:each) do
      user2 = User.create!(name: 'Example User02', email: 'example-2@user.com', password: 'password', password_confirmation: 'password')

      Vote.create!(user_id: user.id, article_id: article1.id)
      Vote.create!(user_id: user.id, article_id: article2.id)

      Vote.create!(user_id: user2.id, article_id: article1.id)
      visit root_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Login'
    end

    context 'articles#index' do
      scenario "index page shows current user's name" do
        expect(page).to have_text('Example')
      end

      scenario 'index page shows max voted article' do
        expect(page).to have_text('Example Title01')
      end

      scenario 'index page shows list of categories' do
        expect(page).to have_text('Anything')
        expect(page).to have_text('Category2')
      end
    end

    context 'articles#new and articles#create' do
      before(:each) do
        click_link 'write new article'
      end

      scenario "create article page has text 'Create new article'" do
        expect(page).to have_text('Create new article')
      end

      scenario 'create article page has a form' do
        expect(page).to have_selector('.form')
      end

      scenario 'create article page shows categories list' do
        expect(page).to have_selector('.category-list .category', count: 2)
      end

      scenario 'create article page creates an article' do
        fill_in 'article_title', with: 'Test title'
        fill_in 'article_image', with: 'https://example.com'
        fill_in 'article_category_list', with: 'Anything'
        fill_in 'article_text', with: 'Test article text'

        click_button 'Submit'

        sleep(3)

        expect(page).to have_text('Article successfully created')
      end
    end
  end
end
# rubocop:enable  Layout/LineLength
# rubocop:enable  Metrics/BlockLength
