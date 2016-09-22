class Dog
  def sound
    'bark'
  end
end

class NilAnimal
  def sound

  end
end

def get_animal(type)
  case type
  when :dog
    Dog.new
  when nil
    NilAnimal.new
  end
end
p get_animal(:dog).sound
p get_animal(nil).sound
