

  
class Chat < ActiveRecord::Base
   belongs_to :user
  
  validates :from, :to, :message, :presence => true
  
  attr_accessible :from, :to, :message, :sent
  
  
  def self.update_status(me)
     if me.status != "online"
       @user = User.find(:first, :conditions => ["email= '#{me.email}'"])
       
       @user.update_attribute(:status, "online")
    end
  end
  
  
end



