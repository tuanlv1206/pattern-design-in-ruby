class SimpleMath
  def initialize
    @result = 0
  end
  def add(val)
    @result += val
    self
  end
  def subtract(val)
    @result -= val
  end
  # def to_s
  #   @result
  # end
end
n = SimpleMath.new
p n.add(2).add(2).subtract(1)

class MathMultipleArg
  def initialize
    @result = 0
  end
  def add(*val)
    @result += val.inject(&:+)
    self
  end
  def subtract(*val)
    @result -= val.inject(&:+)
    self
  end
end

math = MathMultipleArg.new
p math.add(1,1).add(1,1,1,1).subtract(1,1)
