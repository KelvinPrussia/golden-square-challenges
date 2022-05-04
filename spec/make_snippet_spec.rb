require 'make_snippet'

RSpec.describe "make_snippet" do
  it "returns first five words of a string" do
    result = make_snippet("make a string up I guess")
    expect(result).to eq "make a string up I..."
  end
end
