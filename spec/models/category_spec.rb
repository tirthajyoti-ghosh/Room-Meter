require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it { should have_many(:categorizations).dependent(:destroy) }
    it { should have_many(:articles).through(:categorizations) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe 'default scope' do
    let(:category1) { Category.create!(name: 'Category1', priority: 3) }
    let(:category1) { Category.create!(name: 'Category2', priority: 4) }

    it 'should return categories ordered by priority DESC' do
      expect(Category.all.to_sql).to eq(Category.order(priority: :desc).to_sql)
    end
  end
end
