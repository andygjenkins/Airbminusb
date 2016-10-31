require 'spec_helper'

describe Place do
  subject {Place.create(name: 'sofa', price: 120, description: 'really comfy', start_availability: Date.new(2016,1,1), end_availability: Date.new(2017,1,1), user_id: 1)}

  describe '#name' do
    it 'has a name' do
      expect(subject.name).to eq 'sofa'
    end
  end

  describe '#price' do
    it 'has a price' do
      expect(subject.price).to eq 120
    end
  end

  describe '#description' do
    it 'has a description' do
      expect(subject.description).to eq 'really comfy'
    end
  end

  describe '#start_availability' do
    it 'has a start availability' do
      expect(subject.start_availability.to_s).to eq '2016-01-01'
    end
  end

  describe '#end_availability' do
    it 'has an end availability' do
      expect(subject.end_availability.to_s).to eq '2017-01-01'
    end
  end

  describe '#within_available_range?' do
    it 'returns true when date is within range' do
      expect(subject.within_available_range?(Date.new(2016,6,6))).to eq true
    end

    it 'returns false when date is before range' do
      expect(subject.within_available_range?(Date.new(2015,6,6))).to eq false
    end

    it 'returns false when date is after range' do
      expect(subject.within_available_range?(Date.new(2017,6,6))).to eq false
    end
  end
end