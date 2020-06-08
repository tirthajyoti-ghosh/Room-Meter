require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "associations" do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:votes).dependent(:destroy) }
    it { should have_many(:categorizations).dependent(:destroy) }
    it { should have_many(:categories).through(:categorizations) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:image) }
    it { should validate_length_of(:title).is_at_least(5).is_at_most(50) }
    it { should validate_length_of(:text).is_at_least(20).is_at_most(35000) }
  end

  describe "default scope" do
    let(:user) { User.create!(name: "Example User", 
                              email: "example@user.com", 
                              password: "password", 
                              password_confirmation: "password") }
    let(:article) {  } 
    it "should return articles ordered by most recent" do
      
    end
    
  end
  
  
end
