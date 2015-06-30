class DinoViewer

  def show(dinosaur)
    dino = Dinosaur.name == dinosaur

    puts dino.name
    puts dino.genus
    puts dino.period
    puts dino.continent
    puts dino.diet
    puts dino.weight
    puts dino.walking
    puts dino.description
  end

  def carnivores
    Dinosaur.list_carnivores.each { |dino| puts dino.name }
  end

  def bipeds
    Dinosaur.list_bipeds.each { |dino| puts dino.name }
  end

  def search_by_period(period)
    
  end

end
