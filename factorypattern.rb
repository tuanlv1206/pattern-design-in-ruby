class Shape
  def initialize(*arg)

  end
  def draw
    raise "not allowed here"
  end
end

class Triangle < Shape
  def draw
    "drawing triangle"
  end
end

class Square < Shape
  def draw
    "drawing square"
  end
end

class Circle < Shape
  def draw
    "drawing circle"
  end
end

class ShapeFactory
  def self.build(shape, *args)
    case shape
    when :triangle
      Triangle.new(*args)
    when :square
      Square.new(*args)
    when :circle
      Circle.new(*args)
    end
  end
end

puts ShapeFactory.build(:triangle,3,4,5,9).draw
puts ShapeFactory.build(:square,563,63).draw
puts ShapeFactory.build(:circle,5234,5425).draw
