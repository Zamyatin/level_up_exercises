class DinoParser
  attr_accessor :dinosaurs :files

  def initialize(files=[])
    @files = files
    @dinosaurs = []
  end

  def parse_dinosaurs(file)
    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
      @dinosaurs << Dinosaur.new(row.standardize!)
  end

  def process_files(@files)
    @files.each { |file| parse_dinosaurs(file) }
  end

  private
  def standardize!
    if self.diet == "Carnivore" || "Insectivore" || "Piscivore" || "Yes"
      self.diet = "Carnivore"
    else
      self.diet = "Herbivore"
    end
  end

end
