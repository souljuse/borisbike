class Bike
  def broken?
    @broken
  end
  def report_broken
    @broken = true
  end
  def fix_bike
    @broken = false
  end
end
