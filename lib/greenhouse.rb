require 'digest/sha2'

class Greenhouse
  attr_reader :id, :name
  attr_accessor :containers, :age

  def initialize(name,containers={})
    idsha=Digest::SHA2.hexdigest "#{name}"+"#{Time.now.to_i}"
    @id=idsha[0...4]
    @containers=containers
    @time=0
    @age=Age.new
  end

  def add_container(name: 'Container', input: nil, output: nil)
    container=Greenhouse::Container.new(name,input,output)
    @containers[:"#{container.id}"]=container
    container.id
  end

end

class Greenhouse::Container
  attr_reader :id, :input
  attr_accessor :output
  def initialize(name,input,output)
    idsha=Digest::SHA2.hexdigest "#{name}"+"#{Time.now.to_i}"
    @id=idsha[0...4]
    @name=name
    @input=input
    @output=output
  end

  def new_input=(newinput)
    @input=Array.new if @input.nil?
    # If its a plant check for soil
    case
      when newinput.instance_of?(Plant::Tomato)
        if @input.find(instance_of?(Soil))
           @input << newinput
        else
           raise ArgumentError "This container has no soil, I did not put the plant in: #{self.inspect}"
        end
      when newinput.instance_of?(Soil)
           @input << newinput
     end
    end
end
