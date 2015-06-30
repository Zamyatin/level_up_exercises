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
    case size 
    when size == "big"
      self.dinosaurs.select{ |dino| dino.weight_in_lbs > 2000 }
    when size == "small"
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
    case standard_keys[:diet]
    when "Yes"
      standard_keys[:diet] = "Carnivore"
    when ""
      standard_keys[:diet] = "No Info"
    else
      standard_keys[:diet] = "Herbivore"
    end
    standard_keys
  end

  def parse_dinosaurs(file)
    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
      @dinosaurs << Dinosaur.new(standardize(row))
    end
  end
end