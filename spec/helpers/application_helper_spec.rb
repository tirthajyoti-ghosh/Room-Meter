require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

# rubocop:disable  Layout/LineLength
RSpec.describe ApplicationHelper, type: :helper do
  let(:user) { User.create!(name: 'Example User01', email: 'example-1@user.com', password: 'password', password_confirmation: 'password') }

  let(:user2) { User.create!(name: 'Example User02', email: 'example-2@user.com', password: 'password', password_confirmation: 'password') }

  let(:category) { Category.create!(name: 'Anything', priority: 5) }

  let(:article1) { user.articles.create!(title: 'Example Title01', text: 'Example text01', image: 'https://example.com', category_list: 'Anything') }

  let(:article2) { user.articles.create!(title: 'Example Title02', text: 'Example text02', image: 'https://example.com', category_list: 'category2') }

  before do
    Vote.create!(user_id: user.id, article_id: article1.id)
    Vote.create!(user_id: user2.id, article_id: article1.id)

    Vote.create!(user_id: user.id, article_id: article2.id)
  end

  describe 'display_vote_for' do
    it "returns an a tag with class 'vote' when user has not already voted" do
      expect(display_vote_for(article2, user2.id)).to match(/<a class="vote"/)
    end

    it "returns a p tag with class 'voted' when user has already voted" do
      expect(display_vote_for(article1, user2.id)).to match(/<p class="voted"/)
    end
  end
end
# rubocop:enable  Layout/LineLength
