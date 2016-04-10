class Age
attr_reader :age, :units

  def initialize
    @age=0
    @units=86400
  end

  def add_time(x)
    @age+=(x*@units)
  end

  def remove_time(x)
    @age-=(x*@units)
  end

end