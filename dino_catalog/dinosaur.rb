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

end
