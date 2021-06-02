class Oystercard

   MAX_BALANCE = 90
   MIN_CHARGE = 1
   attr_reader :balance, :entry_station
  
   def initialize
    @balance = 0
    @entry_station = nil
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
    end 

   def touch_out
    deduct(MIN_CHARGE)
    @entry_station = nil
   end


   private 

   def deduct(amount)
    @balance -= amount 
   end
end