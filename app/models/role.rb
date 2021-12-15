class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map {|a|
            a.actor
        }
    end

    def locations
        self.auditions.map do |a|
            a.location
        end
    end

    def lead
        hired = self.auditions.find {|a| a.hired == true}
        hired ? hired : "no actor has been hired for this role"
    end

    def understudy
        all_hired = self.auditions.filter {|a| a.hired == true}
        all_hired[1] ? all_hired[1] : "no actor has been hired for understudy for this role"
    end
end