

require_relative '../lib/dark_trader.rb'
require 'pry'

describe "dark_trader" do
  #describe "the method" do
    array_of_hashes = get_cryptocurrencies
    it "Should return an array and not nil" do
      expect(array_of_hashes).not_to be_nil
    end
    it "Should return an array containing a few currencies" do
      expect(array_of_hashes.any? {"ETH" "EOS" "XTZ"}).to be true
    end
    it "Should return an array with more than 10 hashes" do
        expect(array_of_hashes.size).to be > 10
      end
  #end
end
