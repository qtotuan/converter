require "spec_helper"



RSpec.describe "Converter" do
  describe ".in_english" do
    it 'converts a postive number into english words' do
      expect(Converter::EnglishNumber.new(0).in_english).to eq("zero")
      expect(Converter::EnglishNumber.new(6).in_english).to eq("six")
      expect(Converter::EnglishNumber.new(11).in_english).to eq("eleven")
      expect(Converter::EnglishNumber.new(22).in_english).to eq("twenty-two")
      expect(Converter::EnglishNumber.new(24.5).in_english).to eq("twenty-four")
      expect(Converter::EnglishNumber.new(101).in_english).to eq(nil)
      expect(Converter::EnglishNumber.new(30).in_english).to eq("thirty")
    end

    it 'converts a negative number into english words' do
      expect(Converter::EnglishNumber.new(-6).in_english).to eq("negative six")
      expect(Converter::EnglishNumber.new(-11).in_english).to eq("negative eleven")
      expect(Converter::EnglishNumber.new(-22).in_english).to eq("negative twenty-two")
      expect(Converter::EnglishNumber.new(-24.5).in_english).to eq("negative twenty-four")
      expect(Converter::EnglishNumber.new(-101).in_english).to eq(nil)
      expect(Converter::EnglishNumber.new(-30).in_english).to eq("negative thirty")
    end
  end
end
