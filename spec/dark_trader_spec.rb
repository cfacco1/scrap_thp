require_relative '../lib/dark_trader'

#Test if the program do something and get data 

describe "data data" do
    it "should return symbol" do
      expect(crypto_name).not_to be_nil
      expect(crypto_price).not_to be_nil
    end

#Test that the program is an array of hashes 

    it "should return a hash" do 
      expect(solution_hash).not_to be_nil
    end
end
