require './oystercard.rb'
describe Oystercard do
    let(:station){ double :station}
it 'has a balance of zero' do
    expect(subject.balance). to eq(0)
end
 
context '#top_up' do

    it 'can top up balance' do
        expect{ subject.top_up(1)}.to change{ subject.balance }.by(1)
    end

    it 'raises an error if the max balance is exceeded' do
    max_balance = Oystercard::MAX_BALANCE
    subject.top_up(max_balance)
    expect{ subject.top_up(1)}.to raise_error "max balance of #{max_balance} exceeded"
    end
end

context '#deduct' do 

    it 'deducts an amount from the balance' do 
        journey = Oystercard.new
        journey.top_up(20)
        journey.touch_in(station)
        expect {journey.touch_out(station)}.to change{ journey.balance }.by(-1)
    end 
    end

describe '#in_journey?' do
    it 'is initially not in a journey' do
    expect(subject.in_journey?).to eq(false)
   end

   it 'can touch in' do
       journey = Oystercard.new
       journey.top_up(10)
       journey.touch_in(station)
       expect(journey.in_journey?).to eq(true)
   end

   it 'can touch out' do
       journey = Oystercard.new
       journey.top_up(10)
       journey.touch_in(station)
       journey.touch_out(station)
       expect(journey.in_journey?).to eq(false)
   end
   
   it 'can raise insufficient funds error' do
       journey = Oystercard.new
       expect{journey.touch_in(station)}.to raise_error('insufficient funds')
   end

   it 'can deduct min charge when touched out' do
       journey = Oystercard.new
       journey.top_up(10)
       journey.touch_in(station)
       expect{ journey.touch_out(station) }.to change{ journey.balance}.by(-1)
   end

   it 'stores the entry station' do
    journey = Oystercard.new
    journey.top_up(10)
    journey.touch_in(station)
    expect(journey.entry_station).to eq(station)    
   end

   it 'checks that entry and exit station are stored' do
       journey = Oystercard.new
       journey.top_up(10)
       journey.touch_in(station)
       journey.touch_out(station)
       expect(journey.list_of_journeys).to eq ([{station => station}])
   end

   it 'has an empty list of journeys by default' do
       journey = Oystercard.new
       expect(journey.list_of_journeys).to be_empty
   end
end

end