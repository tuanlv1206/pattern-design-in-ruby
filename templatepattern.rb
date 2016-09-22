class Game
  def run
    boot
    startGame
    endGame
  end
end

class Chess < Game
  def boot
    puts "Initialized Chess Game"
  end
  def startGame
    puts "Chess Game is starting"
  end
  def endGame
    puts "Chess Game is finished"
  end
end

class Porker < Game
  def boot
    puts "Initialized Porker Game"
  end
  def startGame
    puts "Porker Game is starting"
  end
  def endGame
    puts "Porker Game is finish"
  end
end

chess = Chess.new
chess.run

porker = Porker.new
porker.run

