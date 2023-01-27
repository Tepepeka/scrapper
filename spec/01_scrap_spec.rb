require_relative '../lib/01_scrap'


describe "the open uri page method" do
    it "should return a nokogiri document" do
        expect(open_page("https://coinmarketcap.com/fr/").class).to eq(Nokogiri::HTML4::Document)
    end
end


describe "the scrap crypto name method" do
    it "should return an array of crypto name" do
        expect(scrap_crypto_name(Nokogiri::HTML(URI.open("https://coinmarketcap.com/fr/"))).nil?).to eq(false)
    end
end


describe "the scrap crypto value method" do
    it "should return an array of crypto value" do
        expect(scrap_crypto_value(Nokogiri::HTML(URI.open("https://coinmarketcap.com/fr/"))).nil?).to eq(false)
    end
end


describe "te hash into array method" do
    it "should make an array of hash of name/value" do
        expect(hash_into_array(["bitcoin"],[10])).to eq([{"bitcoin"=>10}])
    end
end