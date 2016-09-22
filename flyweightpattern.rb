class Lamp
  attr_reader :color
  def initialize(color)
    @color = color
  end
end
class TreeBranch
  def initialize(branch_number)
    @branch_number = branch_number
  end
  def hang(lamp)
    puts "Hang #{lamp.color} lamp on branch #{@branch_number}"
  end
end

# flyweight factory
class LampFactory
  def initialize
    @lamps = {}
  end
  def find_lamp(color)
    if @lamps.has_key?(color)
      lamp = @lamps[color]
    else
      lamp = Lamp.new(color)
      @lamps[color] = lamp
    end
  end

  def total_number_of_lamps_made
    @lamps.size
  end
end
class ChristmasTree
  def initialize
    @lamp_factory = LampFactory.new
    @lamps_hung = 0

    dress_up_the_tree
  end

  def hang_lamp(color, branch_number)
    TreeBranch.new(branch_number).hang(@lamp_factory.find_lamp(color))
    @lamps_hung += 1
    self
  end

  def dress_up_the_tree
    hang_lamp('red', 1)
    hang_lamp('blue', 1)
    hang_lamp('yellow', 1)
    hang_lamp('red', 2)
    hang_lamp('blue', 2)
    hang_lamp('yellow', 2)
    hang_lamp('red', 3)
    hang_lamp('blue', 3)
    hang_lamp('yellow', 3)
    hang_lamp('red', 4)
    hang_lamp('blue', 4)
    hang_lamp('yellow', 4)
    hang_lamp('red', 5)
    hang_lamp('blue', 5)
    hang_lamp('yellow', 5)
    hang_lamp('red', 6)
    hang_lamp('blue', 6)
    hang_lamp('yellow', 6)
    hang_lamp('red', 7)
    hang_lamp('blue', 7)
    hang_lamp('yellow', 7)

  end
  def display
    puts "Made #{@lamp_factory.total_number_of_lamps_made} total lamps"
    puts "Hung #{@lamps_hung} total lamps"
  end
end
p ChristmasTree.new
a = ChristmasTree.new.hang_lamp("green",8)
a.display

