class DinoParser
  attr_reader :files

  def initialize(files = [])
    @files = files
  end

  def process_files
    self.files.each { |file| parse_dinosaurs(file) }
  end

  def save(filename, dinodex)
    unless File.exist?(filename)
      File.new(filename, "w+")
    end
    CSV.open(filename, "w") do |csv|
      dinodex.dinosaurs.each do |dino|
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
    clean_description(standard_keys)

    standard_keys
  end

  def clean_diet(keys={})
    case keys[:diet]
    when "Yes"
      keys[:diet] = "Carnivore"
    when ""
      keys[:diet] = nil
    else
      keys[:diet] = keys[:diet]
    end
  end

  def clean_weight(keys={})
    case keys[:weight_in_lbs]
    when ""
      keys[:weight_in_lbs] = nil
    when nil
      keys[:weight_in_lbs] = nil
    when 0
      keys[:weight_in_lbs] = nil
    else
      keys[:weight_in_lbs] = keys[:weight_in_lbs].to_i
    end
  end

  def clean_description(keys={})
    case keys[:description]
    when ""
      keys[:description] = nil
    else
      keys[:description] = keys[:description]
    end
  end

  def parse_dinosaurs(file)
    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
      dinodex.dinosaurs << Dinosaur.new(standardize(row))
    end
  end
end
