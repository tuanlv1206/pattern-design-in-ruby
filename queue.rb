class Queue
  def initialize
    @elements = []
  end
  def length
    @elements.length
  end
  def enqueue(x)
    @elements.push x
    self
  end
  def dequeue
    @elements.shift
  end
  def display
    puts "FirstMost : Positition " + @elements.join("-") + " RightMost : Positition"
  end
end

testQueue = Queue.new()
testQueue.enqueue(3).enqueue(5).enqueue(10)
testQueue.display
puts testQueue.length
dequeued = testQueue.dequeue
puts dequeued
testQueue.display

