class Oystercard

   MAX_BALANCE = 90
   MIN_CHARGE = 1
   attr_reader :balance, :entry_station, :list_of_journeys
  
   def initialize
    @balance = 0
    @entry_station = nil
    @list_of_journeys = []
   end
    
   def top_up(amount)
      raise "max balance of #{MAX_BALANCE} exceeded" if amount + balance > MAX_BALANCE
      @balance += amount 
   end
   
   def in_journey?
    !!entry_station
   end


   def touch_in(station)
     raise 'insufficient funds' if @balance < MIN_CHARGE
     @entry_station = station
     @list_of_journeys.push({@entry_station => ''})
    end 

   def touch_out(station)
    deduct(MIN_CHARGE)
    @exit_station = station
    @list_of_journeys[0][@entry_station] = @exit_station
    @entry_station = nil
   end


   private 

   def deduct(amount)
    @balance -= amount 
   end
end