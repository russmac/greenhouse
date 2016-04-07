require './lib/greenhouse.rb'
require './lib/plant.rb'
# require './lib/soil.rb'


tomato_shed=Greenhouse.new "Tomato Shed"

10.times do |x|
  tomato_shed.add_container name: "#{x}"
end

 tomato_shed.containers.each do |id,container|
   container.ingress=Plant::Tomato.new "tomato"
 end

puts tomato_shed.inspect