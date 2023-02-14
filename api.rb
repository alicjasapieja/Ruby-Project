require 'open-uri'
require 'net/http'
require 'json'
require_relative './name'

loop_var = true 

while loop_var do 

    puts "Search a name: " 

    search_name = gets.chomp.downcase

    uri = URI.parse("https://api.nationalize.io/?name=#{search_name}")
    response = Net::HTTP.get_response(uri)

    if response.code == "200"
        json = JSON.parse(response.body)
        
        if json["country"].length>0
            name = Name.new(json["country"][0]["country_id"],json["country"][0]["probability"])
            name.print_details

        else 
            puts "No result found"

        end


    else
        puts "No result found"
    end

    puts "Press Y to search again, or press any key to exit"

    if (gets.chomp.downcase != 'y')
        loop_var = false

    end
end

