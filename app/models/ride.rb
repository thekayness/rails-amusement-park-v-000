class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def not_enough_tickets_statement
  	"You do not have enough tickets to ride the #{attraction.name}."
  end

  def too_short_statement
  	"You are not tall enough to ride the #{attraction.name}."
  end

  def thank_you_statement
    "Thanks for riding the #{self.attraction.name}!"
  end

  def take_ride
  	if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
  		"Sorry. " + not_enough_tickets_statement + " " + too_short_statement
  	elsif self.user.height < self.attraction.min_height
  		"Sorry. " + too_short_statement
  	elsif self.user.tickets < self.attraction.tickets
  		"Sorry. " + not_enough_tickets_statement
  	else
  		self.user.tickets -= self.attraction.tickets
  		self.user.nausea += self.attraction.nausea_rating
  		self.user.happiness += self.attraction.happiness_rating
  		self.user.save
      thank_you_statement
  	end
  end


end
