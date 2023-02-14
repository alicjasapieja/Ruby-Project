class Name

    attr_reader :country_id,:probability

    def initialize(country_id,probability)
        @country_id = country_id
        @probability = probability
    end

    def print_details 
        puts "Your origin is: #{self.country_id}"
        puts "The probability is: #{self.probability}"
     
    end

end