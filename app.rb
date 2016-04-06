require './lib/greenhouse.rb'
# require './lib/soil.rb'
# require './lib/plant.rb'

tomato_shed=Greenhouse.new "Tomato Shed"

10.times do |x|
  tomato_shed.add_container name: "#{x}"
end

puts tomato_shed.containers.inspect