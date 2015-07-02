class DinoDex
  attr_accessor :dinosaurs

  def initialize
    @dinosaurs = []
  end
  
  def add(dino)
    self.dinosaurs << dino
  end
  
  def find_bipeds
    self.dinosaurs.select{ |dino| dino.walking == "Biped" }
  end
  
  def find_carnivores
    self.dinosaurs.select{ |dino| dino.is_carnivore? }
  end
  
  def find_by_period(era)
    self.dinosaurs.select{ |dino| dino.period.include? era }
  end
  
  def find_by_size!(size)
    if size.downcase == "big"
      self.dinosaurs.select{ |dino| dino.weight_in_lbs > 2000 }
    elsif size.downcase == "small"
      self.dinosaurs.select{ |dino| dino.weight_in_lbs <= 2000 }
    else 
      raise "That's not an acceptable input!"
    end
  end
  
  def to_json
    dinos = self.dinosaurs.each { |dino| dino.to_json }
    dinos.to_json
  end
  
end