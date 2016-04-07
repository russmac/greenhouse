require 'digest/sha2'

class Greenhouse
  attr_reader :id, :name
  attr_accessor :containers

  def initialize(name,containers={})
    idsha=Digest::SHA2.hexdigest "#{name}"+"#{Time.now.to_i}"
    @id=idsha[0...4]
    @containers=containers
  end

  def add_container(name: 'Container', ingress: nil, egress: nil)
    container=Greenhouse::Container.new(name,ingress,egress)
    @containers[:"#{container.id}"]=container
    container.id
  end

end

class Greenhouse::Container
  attr_reader :id
  attr_accessor :ingress, :egress
  def initialize(name,ingress,egress)
    idsha=Digest::SHA2.hexdigest "#{name}"+"#{Time.now.to_i}"
    @id=idsha[0...4]
    @name=name
    @ingress=ingress
    @egress=egress
  end

end