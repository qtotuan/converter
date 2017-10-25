require "spec_helper"

RSpec.describe "Converter" do
  describe ".in_english" do
    it 'converts 0 to "zero"' do
      expect(Converter::EnglishNumber.new(0).in_english).to eq("zero")
      expect(Converter::EnglishNumber.new(0.5).in_english).to eq("zero")
      expect(Converter::EnglishNumber.new(-0.5).in_english).to eq("zero")
    end

    it 'converts a one- and two-digit positive integer into English words' do
      expect(Converter::EnglishNumber.new(6).in_english).to eq("six")
      expect(Converter::EnglishNumber.new(11).in_english).to eq("eleven")
      expect(Converter::EnglishNumber.new(22).in_english).to eq("twenty-two")
      expect(Converter::EnglishNumber.new(30).in_english).to eq("thirty")
    end

    it 'converts a one- and two-digit positive decimal into English words' do
      expect(Converter::EnglishNumber.new(6.5).in_english).to eq("six")
      expect(Converter::EnglishNumber.new(24.5).in_english).to eq("twenty-four")
    end

    it 'converts a one- and two-digit negative integer into English words' do
      expect(Converter::EnglishNumber.new(-6).in_english).to eq("negative six")
      expect(Converter::EnglishNumber.new(-11).in_english).to eq("negative eleven")
      expect(Converter::EnglishNumber.new(-22).in_english).to eq("negative twenty-two")
      expect(Converter::EnglishNumber.new(-30).in_english).to eq("negative thirty")
    end

    it 'converts a one- and two-digit negative decimal into English words' do
      expect(Converter::EnglishNumber.new(-6.5).in_english).to eq("negative six")
      expect(Converter::EnglishNumber.new(-24.5).in_english).to eq("negative twenty-four")
    end

    # it 'returns nil for numbers that are greater/less than 99/-99' do
    #   expect(Converter::EnglishNumber.new(101).in_english).to eq(nil)
    #   expect(Converter::EnglishNumber.new(-101).in_english).to eq(nil)
    # end

    it 'converts a three-digit positive integer into English words' do
      expect(Converter::EnglishNumber.new(100).in_english).to eq("one hundred")
      expect(Converter::EnglishNumber.new(101).in_english).to eq("one hundred one")
      expect(Converter::EnglishNumber.new(111).in_english).to eq("one hundred eleven")
      expect(Converter::EnglishNumber.new(123).in_english).to eq("one hundred twenty-three")
      expect(Converter::EnglishNumber.new(687).in_english).to eq("six hundred eighty-seven")
      expect(Converter::EnglishNumber.new(687.78).in_english).to eq("six hundred eighty-seven")
    end

    it 'converts a three-digit negative integer into English words' do
      expect(Converter::EnglishNumber.new(-100).in_english).to eq("negative one hundred")
      expect(Converter::EnglishNumber.new(-101).in_english).to eq("negative one hundred one")
      expect(Converter::EnglishNumber.new(-111).in_english).to eq("negative one hundred eleven")
      expect(Converter::EnglishNumber.new(-123).in_english).to eq("negative one hundred twenty-three")
      expect(Converter::EnglishNumber.new(-687).in_english).to eq("negative six hundred eighty-seven")
      expect(Converter::EnglishNumber.new(-687.78).in_english).to eq("negative six hundred eighty-seven")
    end

    it 'converts positive thousands integer into English words' do
      expect(Converter::EnglishNumber.new(1000).in_english).to eq("one thousand")
      expect(Converter::EnglishNumber.new(1001).in_english).to eq("one thousand one")
      expect(Converter::EnglishNumber.new(1011).in_english).to eq("one thousand eleven")
      expect(Converter::EnglishNumber.new(1023).in_english).to eq("one thousand twenty-three")
      expect(Converter::EnglishNumber.new(1687).in_english).to eq("one thousand six hundred eighty-seven")
      expect(Converter::EnglishNumber.new(1687.78).in_english).to eq("one thousand six hundred eighty-seven")
    end

    it 'converts negative thousands into English words' do
      expect(Converter::EnglishNumber.new(-1000).in_english).to eq("negative one thousand")
      expect(Converter::EnglishNumber.new(-1001).in_english).to eq("negative one thousand one")
      expect(Converter::EnglishNumber.new(-1011).in_english).to eq("negative one thousand eleven")
      expect(Converter::EnglishNumber.new(-1023).in_english).to eq("negative one thousand twenty-three")
      expect(Converter::EnglishNumber.new(-1687).in_english).to eq("negative one thousand six hundred eighty-seven")
      expect(Converter::EnglishNumber.new(-1687.78).in_english).to eq("negative one thousand six hundred eighty-seven")
    end

    it 'converts positive millions into English words' do
      expect(Converter::EnglishNumber.new(1000000).in_english).to eq("one million")
      expect(Converter::EnglishNumber.new(1000001).in_english).to eq("one million one")
      expect(Converter::EnglishNumber.new(1000011).in_english).to eq("one million eleven")
      expect(Converter::EnglishNumber.new(1000023).in_english).to eq("one million twenty-three")
      expect(Converter::EnglishNumber.new(1369687).in_english).to eq("one million three hundred sixty-nine thousand six hundred eighty-seven")
      expect(Converter::EnglishNumber.new(1369687.78).in_english).to eq("one million three hundred sixty-nine thousand six hundred eighty-seven")
      expect(Converter::EnglishNumber.new(961349687).in_english).to eq("nine hundred sixty-one million three hundred fourty-nine thousand six hundred eighty-seven")
    end

    it 'converts negative millions into English words' do
      expect(Converter::EnglishNumber.new(-1000000).in_english).to eq("negative one million")
      expect(Converter::EnglishNumber.new(-1000001).in_english).to eq("negative one million one")
      expect(Converter::EnglishNumber.new(-1000011).in_english).to eq("negative one million eleven")
      expect(Converter::EnglishNumber.new(-1000023).in_english).to eq("negative one million twenty-three")
      expect(Converter::EnglishNumber.new(-1369687).in_english).to eq("negative one million three hundred sixty-nine thousand six hundred eighty-seven")
      expect(Converter::EnglishNumber.new(-1369687.78).in_english).to eq("negative one million three hundred sixty-nine thousand six hundred eighty-seven")
      expect(Converter::EnglishNumber.new(-961349687).in_english).to eq("negative nine hundred sixty-one million three hundred fourty-nine thousand six hundred eighty-seven")
    end

    it 'converts positive billions into English words' do
      expect(Converter::EnglishNumber.new(1000000000).in_english).to eq("one billion")
      expect(Converter::EnglishNumber.new(1000000001).in_english).to eq("one billion one")
      expect(Converter::EnglishNumber.new(1000000011).in_english).to eq("one billion eleven")
      expect(Converter::EnglishNumber.new(1000000023).in_english).to eq("one billion twenty-three")
      expect(Converter::EnglishNumber.new(1369687257).in_english).to eq("one billion three hundred sixty-nine million six hundred eighty-seven thousand two hundred fifty-seven")
      expect(Converter::EnglishNumber.new(1369687257.345).in_english).to eq("one billion three hundred sixty-nine million six hundred eighty-seven thousand two hundred fifty-seven")
      expect(Converter::EnglishNumber.new(415369687257).in_english).to eq("four hundred fifteen billion three hundred sixty-nine million six hundred eighty-seven thousand two hundred fifty-seven")
      expect(Converter::EnglishNumber.new(415369687257.99).in_english).to eq("four hundred fifteen billion three hundred sixty-nine million six hundred eighty-seven thousand two hundred fifty-seven")
    end

  end
end
