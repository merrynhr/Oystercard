require 'journey'
require 'oystercard'
describe Journey do
  let(:station){ double :station}
describe '#in_journey?' do
    it 'is initially not in a journey' do
    expect(subject.in_journey?).to eq(false)
   end
end


it 'is in journey after start' do
    journey = Journey.new
    #journey.top_up(10)
    journey.start(station)
    expect(journey.in_journey?).to eq(true)
end


it 'journey over after finish' do
    journey = Journey.new
    journey.start(station)
    journey.finish(station)
    expect(journey.in_journey?).to eq(false)
end



describe '#list_of_journeys' do
    it 'checks that start and finish are stored' do
        journey = Journey.new
        journey.start(station)
        journey.finish(station)
        expect(journey.list_of_journeys).to eq ([{station => station}])
    end
end


 
    it 'has an empty list of journeys by default' do
        journey = Journey.new
        expect(journey.list_of_journeys).to be_empty
    end
 

end