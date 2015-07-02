require_relative '../dinosaur.rb'
require 'rspec'

RSpec.describe Dinosaur, type: :model do
  let (:dino){Dinosaur.new(name: "Rajosaur", period: "Holocene", continent: "North America", diet: "Carnivore", weight_in_lbs: 280, walking: "Biped", description: "He really is the prince of the universe!")}

  describe '#is_carnivore?' do
    it 'returns a boolean value' do
      expect (dino.is_carnivore?).to satisfy{
        |x| x == true || x == false
      }
    end
    it 'properly matches true and false' do
      expect (dino.is_carnivore?).to be_true
    end
  end

  describe '#is_biped?' do
    it 'returns a boolean value' do
      expect (dino.is_biped?).to satisfy{
        |x| x == true || x == false
      }
    end
    it 'properly matches true and false' do
      expect (dino.is_biped?).to be_true
    end
  end

  describe '#validate_weight!' do
    it 'raises argument errors for strings' do
      expect (validate_weight("25")).to raise_error(ArgumentError)
    end
    it 'allows nil to pass' do
      expect (validate_weight(nil)).to be_truthy
    end
    it 'allows Integers to pass' do
      expect(validate_weight(25)).to be_truthy
    end
  end

  describe '#validate_description' do
    it 'allows nil to pass' do
      expect (validate_description(nil)).to be_truthy
    end
    it 'returns false on empty strings' do
      expect (validate_description("")).to be_falsey
    end
    it 'returns true on non-empty strings' do
      expect (validate_description(dino.description)).to be_truthy
    end
  end


end
