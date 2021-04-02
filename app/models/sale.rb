class Sale < ActiveRecord::Base

    def self.active
        where("sales.starts_on<=? AND sales.ends_on >= ?", Date.current, Date.current)
    end

    def finished?
        ends_on < Date.current
    end

    def current?
        starts_on >= Date.current
    end

    def active?
        !current? && !finished?
    end
    
end
