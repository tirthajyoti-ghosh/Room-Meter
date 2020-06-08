require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:articles).with_foreign_key('author_id').dependent(:destroy) }
    it { should have_many(:votes).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(30) }
  end
  
  
end
