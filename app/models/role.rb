class Role < ActiveRecord::Base
   has_many :auditions
   def actors
    self.auditions.map {|audition| audition.actor}
   end
   def locations
    self.auditions.map {|audition| audition.location}
   end
   def lead
    lead=self.auditions.find{|audition| audition.hired==true}
        if lead 
            return lead
        else 'No actor has been hired for this role'
        end
   end
   def understudy
    understudy=self.auditions.where(["hired=?",true]).second
    if understudy
        return understudy
    else 'No actor has been hired for understudy for this role'
    end
   end
  end