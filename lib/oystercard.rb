#require_relative 'journey.rb'
class Oystercard

   MAX_BALANCE = 90
   MIN_CHARGE = 1
   PENALTY = 6  

   attr_reader :balance, :penalty_set
  
   def initialize
    @balance = 0
    @penalty_set = false
   end
    
   def top_up(amount)
      raise "max balance of #{MAX_BALANCE} exceeded" if amount + balance > MAX_BALANCE
      @balance += amount 
   end

   def touch_in
     deduct(PENALTY) if @penalty_set == true
     raise 'insufficient funds' if @balance < MIN_CHARGE
     @penalty_set = true
    end 

   def touch_out
    deduct(MIN_CHARGE)
    @penalty_set = false
   end

   private 

   def deduct(amount)
    @balance -= amount 
   end
end