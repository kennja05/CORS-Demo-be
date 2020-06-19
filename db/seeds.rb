# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
destinations = JSON.parse(RestClient.get('https://restcountries.eu/rest/v2/all'))

destinations.each do |country|
    if country['name'] != "South Sudan" #The ER tracker does not have the South Sudan Pound Available, and the Countries API lists no alternate Currencies
        if country['name'] === "Antarctica" || country['name'] === "Virgin Islands (British)" || country['name'] === "Micronesia (Federated States of)" || country['name'] === "Palau" || country['name'] === "Singapore"
            Country.create(name: country['name'], currency_code: country['currencies'][1]['code'], currency_name: country['currencies'][1]['name'])
        elsif country['name'] === "Zimbabwe"
            Country.create(name: country['name'], currency_code: country['currencies'][7]['code'], currency_name: country['currencies'][7]['name'])
        else
            Country.create(name: country['name'], currency_code: country['currencies'][0]['code'], currency_name: country['currencies'][0]['name'])    
        end
    end 
end