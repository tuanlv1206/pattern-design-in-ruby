class Commander
  attr_accessor :command
  def initialize(command)
    @command = command
  end
  def on_button_push
    @command.execute if @command
  end
end

class YourCommand
  def execute
    puts "Executed your command!"
  end
end

save_button = Commander.new(YourCommand.new)
save_button.on_button_push
