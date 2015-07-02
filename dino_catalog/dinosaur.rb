class Dinosaur
  attr_reader :name, :period, :continent, :diet, :weight_in_lbs, :walking, :description

  def initialize(args={})
    @name = args[:name]
    @period = args[:period]
    @continent = args[:continent]
    @diet = args[:diet]
    @weight_in_lbs = args[:weight_in_lbs]
    @walking = args[:walking]
    @description = args[:description]
    
    validate_weight!(@weight_in_lbs)
    validate_description!(@description)
  end
  
  def is_carnivore?
    if self.diet != "Carnivore" || self.diet != nil
    end
  end
  
  def is_biped?
    if self.walking == "Biped"
    end
  end
  

  def to_json
    dinosaur = {
      name: @name,
      period: @period,
      continent: @continent,
      diet: @diet,
      weight_in_lbs: @weight_in_lbs,
      walking: @walking,
      description: @description
    }
    dinosaur.to_json
  end

  private
  
  def validate_weight!(weight)
    if weight != nil && !(weight.is_a? Integer)
      raise "Weight must be an integer!"
    end
  end
  
  def validate_description!(desc)
    if desc != nil && desc == ""
      raise "The description cannot be an empty string!"
    end
  end
  

end
