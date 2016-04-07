require 'digest/sha2'

class Plant

end

class Plant::Tomato
  attr_reader :id, :name
  attr_accessor :water, :fertilizer, :produce
  def initialize(name,ingress: nil, egress: nil)
    idsha=Digest::SHA2.hexdigest "#{name}"+"#{Time.now.to_i}"
    @id=idsha[0...4]
    @name=name
    @ingress=ingress
    @egress=egress
    @water=0
    @fertilizer=0
    @produce=0
  end

end