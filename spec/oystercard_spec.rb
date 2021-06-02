require './oystercard.rb'
describe Oystercard do
it 'has a balance of zero' do
    expect(subject.balance). to eq(0)
end
 
context '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

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
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deducts an amount from the balance' do 
        subject.top_up(20)
        expect {subject.deduct(3)}.to change{ subject.balance }.by(-3)
    end 
    end

describe '#in_journey' do
    it 'is initially not in a journey' do
    expect(subject.in_journey).to eq(false)
   end

   it 'can touch in' do
       subject.touch_in
       expect(subject.in_journey).to eq(true)
   end

   it 'can touch out' do
       subject.touch_out
       expect(subject.in_journey).to eq(false)
   end


end
end