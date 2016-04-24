require './lib/greenhouse'
require './lib/plant'
require './lib/soil'
require './lib/age'
require "./spec/spec_helper"


describe Greenhouse do

  before(:all) do
    @rspec_shed=Greenhouse.new "rspec_shed"
  end

  describe "add a container" do

    it "Creates a container in the greenhouse and returns an id string" do
      expect(@rspec_shed.add_container).to match(/\w{4}/)
    end
  end

  describe "list greenhouse containers" do
    it "Lists the containers in the greenhouse" do
      expect(@rspec_shed.containers).to be_instance_of(Hash)
      @rspec_shed.containers.each_value do |container|
        expect(container).to be_instance_of(Greenhouse::Container)
      end
    end
  end

   describe "plant tomato" do
     it "puts soil and plants a tomato in each of the containers." do
     containers=@rspec_shed.containers
       containers.each_value do |container|
         container.new_input=Soil.new "Soil"
         container.new_input=Plant::Tomato.new "Tomato seedling"
         expect(container.input).to include(an_instance_of(Soil))
       end
     end
   end

  describe "plant tomato with no soil" do
    it "trys to plant a tomato in each of the containers with no soil." do
      @rspec_shed=Greenhouse.new "rspec_shed"
      containers=@rspec_shed.containers
      containers.each_value do |container|
        expect{container.new_input=Plant::Tomato.new "Tomato seedling"
        }.to raise_error(ArgumentError)
      end
    end
  end

end


