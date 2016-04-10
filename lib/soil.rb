require 'digest/sha2'

class Soil

  attr_reader :id, :name
  attr_accessor :water, :fertilizer, :input, :output
  def initialize(name,input: nil, output: nil)
    idsha=Digest::SHA2.hexdigest "#{name}"+"#{Time.now.to_i}"
    @id=idsha[0...4]
    @name=name
    @water=0
    @fertilizer=0
    @input=input
    @output=output
    @age=0
  end

end