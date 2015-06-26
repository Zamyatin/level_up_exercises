class Dinosaur
  attr_reader :name :genus :period :continent :diet :weight :walking :description

  def initialize(args={})
    @name = args[:name]
    @genus = args[:genus]
    @period = args[:period]
    @continent = args[:continent]
    @diet = args[:diet] || args[:carnivore]
    @weight = args[:weight_in_lbs] || args[:weight]
    @walking = args[:walking]
    @description = args[:description]

    if @diet == "Carnivore" || "Insectivore" || "Piscivore" || "Yes"
      @diet = "Carnivore"
    else
      @diet = "Herbivore"
    end
  end

end
