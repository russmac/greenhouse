require './lib/greenhouse.rb'
require './lib/plant.rb'
require './lib/soil.rb'
require './lib/age.rb'

tomato_shed=Greenhouse.new "Tomato Shed"

10.times do |x|
  tomato_shed.add_container name: "#{x}"
end

tomato_shed.containers.each do |id,container|
 container.new_input=Soil.new "Soil"
 container.new_input=Plant::Tomato.new "Tomato seedling"
end

tomato_shed.age.add_time 1

puts tomato_shed.inspect