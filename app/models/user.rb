class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_secure_password

  has_many :rides
  has_many :attractions, :through => :rides

  def mood
    if self.happiness > self.nausea
      'happy'
    else
      'sad'
    end
  end

end
