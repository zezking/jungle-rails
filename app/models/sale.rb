class Sale < ActiveRecord::Base
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
