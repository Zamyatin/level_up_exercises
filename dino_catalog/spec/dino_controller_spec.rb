require_relative '../dino_controller.rb'
require_relative '../dinodex.rb'
require_relative '../dino_parser.rb'

RSpec.describe DinoController do
  let (:dinodex){ DinoDex.new }
  let (:parser){ DinoParser.new }
    
