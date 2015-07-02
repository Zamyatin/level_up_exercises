class DinoViewer

  def add_dino_view
    dino = {}
    puts "What is the name of your Dinosaur"
    dino[:name] = gets.chomp
    puts "What prehistoric era did your Dinosaur live?"
    dino[:period] = gets.chomp
    puts "Upon what continent(s) did your Dinosaur live?"
    dino[:continent] = gets.chomp
    puts "What kind of diet did your Dinosaur have?"
    dino[:diet] = gets.chomp
    puts "How heavy was this Dinosaur (in lbs)?"
    dino[:weight] = gets.chomp
    puts "Was your Dinosaur a (Biped) or a (Quadruped)?"
    dino[:walking] = gets.chomp
    puts "Write up a little Description if you'd like..."
    dino[:description] = gets.chomp

    puts "Here's your Dinosaur:"
    dino.each {|k, v| puts "#{k}:  #{v}" }
    puts
    puts "Would you like to store it in your DinoDex? (Y/n)"
    @reponse = gets.downcase.chomp

    if @response == "y" || @response == "yes"
      controller.add_dino(dino, @response)
    else
      viewer.home
    end
  end

  def home
    puts "Hello there Dinosaur Hunter! What would you like to do today??"
    puts "--- Type 'open' to add some CSV files."
    puts "--- Type 'save' to save your Dinosaurs."
    puts "--- Type 'add' to add a Dinosaur."
    puts "--- Type 'search' to pull up Dinosaur Search Functions."
    input = gets.downcase.chomp
    if input == 'open' || input == 'save' || input == 'add' || input == 'search'
      controller.home(input)
    else
      puts "Sorry! That's not a valid option!"
      viewer.home
    end
  end

  def open_files
    files = []
    quit = false
    until quit == true
      puts "Enter the location of your file here"
      input = gets.chomp
      files << input
      puts "Would you like to add another file? (Y/n)"
      quit = gets.downcase.chomp

      if quit == "n" || quit == "no"
        quit = true
      end
    end
    controller.load_files(files)
  end

  def period_picker(periods)
    periods.each_with_index { |o, i| puts "#{i}: #{o}" }
    puts
    puts "Which Period would you like to find Dinosaurs for? (select number)"
    input = get.chomp.to_i
    choice = periods[input]

    controller.dino_by_period(choice)
  end

  def save_files
    puts "Where would you like to save your file?"
    puts "Remember to save it as a CSV file!"
    location = gets.chomp
    controller.save_file(location)
  end

  def search_dinos
    puts "How would you like to search for your Dinosaurs?"
    puts "--- Type 'carnivores' if you'd like to see all the Carnivore Dinosaurs"
    puts "--- Type 'bipedal' to find bipedal Dinosaurs"
    puts "--- Type 'periods' search by Period."
    puts "--- Type 'size' to search by Size."
    puts "--- Type 'home' return Home."

    input = gets.downcase.chomp

    controller.search_dinos(input)
  end

  def size_picker(sizes)
    sizes.each_with_index { |o, i| puts "#{i}: #{o}" }
    puts
    puts "Which size (select number)"
    input = gets.chomp.to_i
    @choice = sizes[input]

    controller.dino_by_size(@choice)
  end

  def show(dinosaurs)
    dinosaurs each do |dino|
      puts dino.name
      puts dino.period
      puts dino.continent
      puts dino.diet
      puts dino.weight
      puts dino.walking
      puts dino.description
      puts
    end
    search_dinos
  end

end
