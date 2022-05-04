require 'count_words'

RSpec.describe "count_words method" do
  it "returns number of words in string" do
    result = count_words("number of words in string")
    expect(result).to eq 5
  end
end