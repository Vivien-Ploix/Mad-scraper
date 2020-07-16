

require_relative '../lib/mairie_christmas.rb'
require 'pry'

describe "get_townhall_email" do
    it "Should return a variable that's not nil" do
      expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")).not_to be_nil
    end
    it "Should return a variable that's not nil" do
        expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")).to eq("mairie.avernes@orange.fr")
    end
end


describe "get_townhall_urls" do
    town_urls = get_townhall_urls
      it "Should return many urls" do
        expect(town_urls.size).to be > 20
      end
      it "Should return specific urls" do
          expect(town_urls.any? {"https://www.annuaire-des-mairies.com/95/avernes.html"}).to be true
      end
  end
  