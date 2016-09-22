class Coffee
  def cost
    2
  end
  def origin
    "Colombia"
  end
end

require 'delegate'
class Decorator < SimpleDelegator
  def class
    __getobj__.class
  end
end
class Milk < Decorator
  def cost
    super + 0.4
  end
end
class Sugar < Decorator
  def cost
    super + 0.2
  end
end
coffee = Coffee.new
puts Sugar.new(Milk.new(coffee)).cost
puts Sugar.new(Sugar.new(coffee)).cost
puts Milk.new(coffee).origin
puts Sugar.new(coffee).origin
puts Sugar.new(Milk.new(coffee)).class
