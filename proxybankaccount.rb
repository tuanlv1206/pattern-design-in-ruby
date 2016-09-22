class Account
  def initialize(amount)
    @amount = amount
  end

  def deposit(amount)
    @amount += amount
  end

  def withdraw(amount)
    @amount -= amount
  end

  def balance
    @amount
  end

  def inspect
    puts "Amount: #{@amount}"
  end
end

class AccountLogger
  undef_method :inspect
  def initialize(amount)
      @operations = []

      @target = Account.new(amount)
      @operations << [:initialize, [amount]]
  end

  def method_missing(method, *args, &block)
    @operations << [method, args]
    @target.send(method, *args, &block)
  end

  def operations
    @operations
  end

end

account = AccountLogger.new(10)
p account.operations

puts account.balance
p account.operations

puts account.deposit(20)
puts account.balance
p account.operations

account.inspect
p account.operations

