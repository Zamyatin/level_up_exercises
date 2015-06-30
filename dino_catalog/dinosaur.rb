class Dinosaur

  def initialize(args={})
    @name = args[:name]
    @genus = args[:genus]
    @period = args[:period]
    @continent = args[:continent]
    @diet = args[:diet] || args[:carnivore]
    @weight = args[:weight_in_lbs] || args[:weight]
    @walking = args[:walking]
    @description = args[:description]
  end

  def self.list_carnivores
    @diet == "Carnivore" || "Insectivore" || "Piscivore"
  end

  def self.list_bipeds
    @walking == "Biped"
  end

  def self.list_by_period(period)
    if period == "Cretaceous"
      @period == "Late Cretaceous" || "Cretaceous" || "Early Cretaceous"
    else
      @period == (period)
    end
  end

  def self.list_by_size!(size)
    if size.downcase != "big" || "small"
      raise "This is not an appropriate size!"
    elsif size.downcase == "big"
        @size >= 2000
    else
      @size < 2000
    end
  end

end
