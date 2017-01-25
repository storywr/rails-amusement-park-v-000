class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if tall_enough?
      if enough_tickets?
        add_nausea
        subtract_tickets
        add_happiness
      else
        "Sorry. You do not have enough tickets the #{self.attraction.name}."
      end
    elsif enough_tickets?
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    end
  end

  def enough_tickets?
    self.user.tickets > self.attraction.tickets
  end

  def tall_enough?
    self.user.height > self.attraction.min_height
  end

  def add_nausea
    self.user.nausea += self.attraction.nausea_rating
    self.user.save
  end

  def add_happiness
    self.user.happiness += self.attraction.happiness_rating
    self.user.save
  end

  def subtract_tickets
    self.user.tickets -= self.attraction.tickets
    self.user.save
  end

end
