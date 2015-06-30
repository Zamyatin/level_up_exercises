class DinoViewer
  def initalize
    puts "Hello there Dinosaur Hunter! What would you like to do today??"
    puts "--- Type 'open' to add some CSV files."
    puts "--- Type 'save' to save your Dinosaurs."
    puts "--- Type 'add' to add a Dinosaur."
    puts "--- Type 'search' to pull up Dinosaur Search Functions."
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
  end


  def bipeds
    Dinosaur.list_bipeds.each { |dino| puts dino.name }
  end

  def search_by_period(period)
    
  end

  def add
    puts "What is the name of your Dinosaur"
    name = gets.chomp
    puts "What prehistoric era did your Dinosaur live?"
    period = gets.chomp
    puts "Upon what continent(s) did your Dinosaur live?"
    continent = gets.chomp
    puts "What kind of diet did your Dinosaur have?"
    diet = gets.chomp
    puts "How heavy was this Dinosaur (in lbs)?"
    weight = gets.chomp
    puts "Was your Dinosaur a (Biped) or a (Quadruped)?"
    walking = gets.chomp
    puts "Write up a little Description if you'd like..."
    description = gets.chomp
    
    dino = Dinosaur.new(name: name, period: period, continent: continent, diet: diet, weight: weight, walking: walking, description: description)
    DinoView::show(dino)
    
    puts "Would you like to save this Dinosaur to your records? (Y/n)"
    choice = gets.chomp.downcase
    
    
    
  end
    
    
end
