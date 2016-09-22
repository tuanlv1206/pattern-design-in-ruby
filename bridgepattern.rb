# Comcrete implementations
class BasicTimeData
  def initialize(hour, minutes)
    @hour = hour
    @minutes = minutes
  end
  def formatted_output
    "Time is #{@hour}:#{@minutes}"
  end
end

class TimeWithMeridianData
  def initialize(hour, minutes, meridian)
    @hour = hour
    @minutes = minutes
    @meridian = meridian
  end
  def formatted_output
    "Time is #{@hour}:#{@minutes} #{@meridian}"
  end
end

# use duck type
# Bridge
module TimeFormatter
  def to_s
    @time_data.formatted_output
  end
end

# Abstract Objects linked to Concrete implementation through Bridge
class BasicTime
  include TimeFormatter
  def initialize(*a, &b)
    @time_data = BasicTimeData.new(*a, &b)
  end
end
class TimeWithMeridian
  include TimeFormatter
  def initialize(*a, &b)
    @time_data = TimeWithMeridianData.new(*a, &b)
  end
end

time1 = BasicTime.new("10", "30")
time2 = TimeWithMeridian.new("10", "30", "PM")
[time1, time2].each {|t| puts t}
