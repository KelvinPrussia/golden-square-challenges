require 'grammar_check'

RSpec.describe "grammar_check method" do

  context "starts with a capial and ends in a period" do
    it "returns true" do
      expect(grammar_check("This is correct.")).to eq true
    end
  end

  context "starts with a capital and ends with an exclamation mark" do
    it "returns true" do
      expect(grammar_check("This is correct!")).to eq true
    end
  end

  context "starts without capital and end in punctuation" do
    it "returns false" do
      expect(grammar_check("this is correct.")).to eq false
    end
  end

  context "doesnt have a capital or punctuation" do
    it "returns false" do
      expect(grammar_check("this is correct")).to eq false
    end
  end

  context "input isnt a string" do
    it "gives an error" do
      expect{grammar_check(100)}.to raise_error "Not a string"
    end
  end

  context "input is nil" do
    it "gives an error" do
      expect{grammar_check(nil)}.to raise_error "Not a string"
    end
  end
end 