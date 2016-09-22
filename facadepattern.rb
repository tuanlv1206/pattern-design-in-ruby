class CPU
  def freeze; end
  def jump(position);end
  def execute; end
end

class Memory
  def load(position, data); end
end

class HardDrive
  def read(lba, size); end
end

class ComputerFacade
  def initialize
    @processor = CPU.new
    @ram = Memory.new
    @hd = HardDrive.new
  end
  def start
    @processor.freeze
    @ram.load(BOOT_ADDRESS, @hd.read(BOOT_SECTOR, SECTOR_SIZE))
    @processor.jump(BOOT_ADDRESS)
    @processor.execute
  end
end

computer_facade = ComputerFacade.new
computer_facade.start
