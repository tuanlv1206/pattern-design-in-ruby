class Strategy
  def doOperation(num1, num2)

  end
end

class OperationAdd < Strategy
  def doOperation(num1, num2)
    num1 + num2
  end
end
class OperationSubstract < Strategy
  def doOperation(num1, num2)
    num1 - num2
  end
end
class OperationMultiply < Strategy
  def doOperation(num1, num2)
    num1 * num2
  end
end

class Context
  attr_reader :strategy
  def initialize(strategy)
     @strategy = strategy
  end
  def executeStrategy(num1, num2)
    @strategy.doOperation(num1, num2)
  end
end

context = Context.new(OperationAdd.new)
puts (" 10 + 5 = #{context.executeStrategy(10, 5)}")

context = Context.new(OperationSubstract.new)
puts (" 10 - 5 = #{context.executeStrategy(10, 5)}")

context = Context.new(OperationMultiply.new)
puts (" 10 * 5 = #{context.executeStrategy(10, 5)}")


