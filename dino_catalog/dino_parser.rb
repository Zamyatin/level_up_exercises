class DinoParser
  attr_reader :dinosaurs, :files

  def initialize(files = [])
    @files = files
    @dinosaurs = []
  end

  def process_files
    self.files.each { |file| parse_dinosaurs(file) }
  end


  private
  def standardize(args={})
    standard_keys = {
      :name => args[:name] || args[:genus],
      :period => args[:period],
      :continent => args[:continent],
      :diet => args[:diet] || args[:carnivore],
      :weight_in_lbs => args[:weight_in_lbs].to_i || args[:weight].to_i,
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