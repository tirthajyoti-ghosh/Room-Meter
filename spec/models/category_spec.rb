require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "associations" do
    it { should have_many(:categorizations).dependent(:destroy) }
    it { should have_many(:articles).through(:categorizations) }
  end

  describe "validations" do
    it { should validate_uniqueness_of(:name).case_insensitive }
  end  
end
