class DinoParser
  attr_reader :dinosaurs, :files

  def initialize(files = [])
    @files = files
    @dinosaurs = []
  end
  
  def add(dino)
    @dinosaurs << dino
  end
  
  def find_bipeds
    self.dinosaurs.select{ |dino| dino.walking == "Biped" }
  end
  
  def find_carnivores
    self.dinosaurs.select{ |dino| dino.diet == "Carnivore" }
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
  
  def find_by_property(args = {})
    
  end
  
  def process_files
    self.files.each { |file| parse_dinosaurs(file) }
  end
  
  def to_json
    dinos = self.dinosaurs.each { |dino| dino.to_json }
    dinos.to_json
  end
  
  def save(filename)
    if ! File.exist?
      File.new(filename, "w+")
    end  
    CSV.open(filename, "w") do |csv|
      @dinosaurs.each do |dino|
        csv << [dino.name, dino.period, dino.continent, dino.diet, dino.weight_in_lbs, dino.walking, dino.description]
      end
    end
  end

  private
  def standardize(args={})
    standard_keys = {
      :name => args[:name] || args[:genus],
      :period => args[:period],
      :continent => args[:continent],
      :diet => args[:diet] || args[:carnivore],
      :weight_in_lbs => args[:weight_in_lbs] || args[:weight],
      :walking => args[:walking],
      :description => args[:description]
    }
    
    clean_diet(standard_keys)
    clean_weight(standard_keys)
    standard_keys
  end
  
  def clean_diet(keys={})
    case keys[:diet]
    when "Yes"
      keys[:diet] = "Carnivore"
    when ""
      keys[:diet] = "No Info"
    else
      keys[:diet] = "Herbivore"
    end  
  end
  
  def clean_weight(keys={})
    case keys[:weight_in_lbs]
    when ""
      keys[:weight_in_lbs] = "No Info"
    when nil
      keys[:weight_in_lbs] = "No Info"
    else 
      keys[:weight_in_lbs] = keys[:weight_in_lbs].to_i
    end
  end

  def parse_dinosaurs(file)
    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
      @dinosaurs << Dinosaur.new(standardize(row))
    end
  end
end