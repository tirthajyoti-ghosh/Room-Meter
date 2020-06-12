require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ArticlesHelper. For example:
#
# describe ArticlesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ArticlesHelper, type: :helper do
  describe "article_row_decider" do
    it "returns div.article-row and div end tag for the first div.article when there is only one article" do
      expect(article_row_decider("top", 0, 1)).to eq("<div class='article-row'>")
      expect(article_row_decider("bottom", 0, 1)).to eq("</div>")
    end
    
    it "returns empty string for the second div.article when there are two articles" do
      expect(article_row_decider("top", 1, 2)).to eq("")
    end
    
    it "returns end div tag for the second div.article when there are two articles" do
      expect(article_row_decider("bottom", 1, 2)).to eq("</div>")
    end
    
    it "returns div.article-row when div.article position is even (0, 2, 4,...)" do
      expect(article_row_decider("top", 2, 4)).to eq("<div class='article-row'>")
    end
    
    it "returns end div tag when div.article position is odd (1, 3, 5,...)" do
      expect(article_row_decider("bottom", 3, 4)).to eq("</div>")
    end
  end
end
