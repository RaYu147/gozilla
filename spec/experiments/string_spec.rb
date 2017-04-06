require 'rails_helper'

describe String do
  describe '#<<' do
    example '文字の追加' do
      s = "ABC"
      s << "D"
      expect(s.size).to eq(4)
    end

    xexample 'nilの追加' do
      s = 'ABCYY'
      s << nil
      expect(s.size).to eq(4)
    end

    example 'cant add nil' do
      s = "ABC"
      expect{ s << nil }.to raise_error(TypeError)
    end
  end
end
