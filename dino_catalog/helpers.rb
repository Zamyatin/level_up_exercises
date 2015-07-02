def controller
  @dinocontroller ||= DinoController.new
end

def viewer
  @dinoviewer ||= DinoViewer.new
end

def dinodex
  @dinodex ||= DinoDex.new
end
