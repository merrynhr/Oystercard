class Journey
  attr_reader :list_of_journeys, :entry_station

  def initialize
    @entry_station = nil
    @list_of_journeys = []
  end

  def in_journey?
    !@entry_station.nil?
  end

  def start(station)
    @entry_station = station
    @list_of_journeys.push({station => ''})
  end

  def finish(station)
    @exit_station = station
    @list_of_journeys[0][@entry_station] = station
    @entry_station = nil
  end

end