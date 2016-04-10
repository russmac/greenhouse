require 'digest/sha2'

class Plant

end

class Plant::Tomato
  attr_reader :id, :name
  attr_accessor :water, :fertilizer, :produce
  def initialize(name,input: nil, output: nil)
    idsha=Digest::SHA2.hexdigest "#{name}"+"#{Time.now.to_i}"
    @id=idsha[0...4]
    @name=name
    @input=input
    @output=output
    @water=0
    @fertilizer=0
    @produce=0
    @age=0
  end

end