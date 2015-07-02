class DinoController

  def load_files(files)
    dinodex
    parser = DinoParser.new(files)
    parser.process_files
    viewer.home
  end

  def add_dino(dino, response)
    if response == "y" || response == "yes"
      dinodex.add(dino)
    else
      viewer.home
    end
  end

  def home(input)
    case input
    when "open"
      viewer.open_files
    when "save"
      viewer.save_files
    when "add"
      viewer.add_dino
    when "search"
      viewer.search_dinos
    else
      puts "That's not a valid option!"
      viewer.home
    end
  end

  def save_file(location)
    if dinodex.dinosaurs.empty?
      puts "You have no data to save!"
      viewer.home
    else 
      dinodex.save(location)
      puts "Save Successful"
      viewer.home
  end

  def search_dinos(input)
    binding.pry
    if dinodex
      case input
      when "carnivores"
        dinos = dinodex.find_carnivores
        viewer.show(dinos)
      when "bipedal"
        dinos = dinodex.find_bipeds
        viewer.show(dinos)
      when "periods"
        available_periods = []
        available_periods << dinodex.dinosaurs.select{ |dino| dino.periods }
        avaialble_periods = available_periods.uniq!
        viewer.period_picker(available_periods)
      when "size"
        sizes = ['big', 'small']
        viewer.size_picker(sizes)
      when "home"
        viewer.home
      else
        puts "That's not a valid option!"
        viewer.search_dinos
      end
    else
      puts "You haven't loaded any dinosaurs yet!"
      viewer.home
      puts
    end
  end

  def dino_by_period(period)
    dinos = dinodex.find_by_period(period)
    viewer.show(dinos)
  end

  def dino_by_size(size)
    dinos = dinodex.find_by_size!(size)
    viewer.show(dinos)
  end


end
