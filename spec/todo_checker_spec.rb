require 'todo_checker'

RSpec.describe "todo_checker method" do
  context "for when string starts with #TODO" do
    it "returns true" do
      expect(todo_checker("#TODO Walk the dog")).to eq true
    end
  end

  context "for when string ends with #TODO" do
    it "returns true" do
      expect(todo_checker("Walk the dog #TODO")).to eq true
    end
  end

  context "for when text doesn't include #TODO" do
    it "returns false" do
      expect(todo_checker("Walk the dog")).to eq false
    end
  end

  context "for when input is not a string" do
    it "raises an error" do
      expect{todo_checker(100)}.to raise_error "Wrong input"
    end
  end

  context "for when input is nil" do
    it "raises an error" do
      expect{todo_checker(nil)}.to raise_error "No input"
    end
  end
end