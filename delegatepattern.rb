class Report
  def records
    puts "Records Report"
  end
  def print
    puts "Print Report"
  end
end
class TriplerReport < Report
  def print
    super
    super
    super
  end
end

report = TriplerReport.new
report.records
report.print

