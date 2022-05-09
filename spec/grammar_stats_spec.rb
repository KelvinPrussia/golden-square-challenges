require 'grammar_stats'

RSpec.describe GrammarStats do
  context "given a text that is gramatically correct" do
    it "returns true when checked" do
      grammar_stats = GrammarStats.new
      expect(grammar_stats.check("Hello.")).to eq true
    end

    it "gives percentage of correct sentences checked" do
      grammar_stats = GrammarStats.new
      grammar_stats.check("Hello.")
      grammar_stats.check("hello.")
      expect(grammar_stats.percentage_good).to eq 50
    end

    it "gives percentage of correct sentences checked (to two decimal places)" do
      grammar_stats = GrammarStats.new
      grammar_stats.check("Hello.")
      grammar_stats.check("hello.")
      grammar_stats.check("hello.")
      expect(grammar_stats.percentage_good).to eq 33.33
    end
  end
  
  context "given that a text is gramatically incorrect" do
    it "returns false when checked" do
      grammar_stats = GrammarStats.new
      expect(grammar_stats.check("Hello")).to eq false
    end
  end

  context "given that no text is gramatically correct" do
    it "gives percentage of correct sentences checked" do
      grammar_stats = GrammarStats.new
      grammar_stats.check("Hello")
      grammar_stats.check("hello.")
      expect(grammar_stats.percentage_good).to eq 0
    end
  end
end