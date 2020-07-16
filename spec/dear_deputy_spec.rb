

require_relative '../lib/dear_deputy.rb'
require 'pry'

describe "get_townhall_email" do
    it "Should return a variable that's not nil" do
      expect(get_mail("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719024")).not_to be_nil
    end
    it "Should return a variable that's not nil" do
        expect(get_mail("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA720162")).to eq("philippe.bolo@assemblee-nationale.fr")
    end
end


describe "get_urls" do
    urls_list = get_urls
      it "Should return many urls" do
        expect(urls_list.size).to be > 15
      end
      it "Should return specific urls" do
          expect(urls_list.any? {"http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA720386"}).to be true
      end
end
  