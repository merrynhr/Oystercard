require 'oystercard'
describe Oystercard do
    #Question? Just a fake class...
    ##let(:station){ double :station}
it 'has a balance of zero' do
    expect(subject.balance). to eq(0)
end
 
describe '#top_up' do

    it 'can top up balance' do
        expect{ subject.top_up(1)}.to change{ subject.balance }.by(1)
    end

    it 'raises an error if the max balance is exceeded' do
    max_balance = Oystercard::MAX_BALANCE
    subject.top_up(max_balance)
    expect{ subject.top_up(1)}.to raise_error "max balance of #{max_balance} exceeded"
    end
end

describe '#deduct' do 

    it 'deducts an amount from the balance' do 
        journey = Oystercard.new
        journey.top_up(20)
        journey.touch_in
        expect {journey.touch_out}.to change{ journey.balance }.by(-1)
    end 
    end


describe '#touch_in' do

   it 'can raise insufficient funds error' do
    journey = Oystercard.new
    expect{journey.touch_in}.to raise_error('insufficient funds')
   end
   
   it 'can incur a penalty charge if no previous touch out' do
       journey = Oystercard.new
       journey.top_up(10)
       journey.touch_in
       expect{journey.touch_in}.to change{journey.balance}.by(-6)
   end

end

describe '#touch_out' do

   it 'can deduct min charge when touched out' do
       journey = Oystercard.new
       journey.top_up(10)
       journey.touch_in
       expect{ journey.touch_out }.to change{ journey.balance}.by(-1)
   end
end
 
end