# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

breweries = [ { name: "Cisco Brewing Co.", location: "Nantucket, MA" },
              { name: "Odell Brewing Co.", location: "Fort Collins, CO" },
              { name: "Harpoon Brewery", location: "Boston, MA" }]

styles = [ { name: "Belgian White" },
           { name: "Pale Ale" },
           { name: "IPA" }]

beers = [ { name: "Grey Lady", brewery_id: 1, style_id: 1 },
          { name: "5 Barrel", brewery_id: 2, style_id: 2 },
          {name: "Harpon IPA", brewery_id: 3, style_id: 3}]


breweries.each do |brewery|
  Brewery.create(brewery)
end

styles.each do |style|
  Style.create(style)
end

beers.each do |beer|
  Beer.create(beer)
end

User.create(username: "admin", password: "password", role: 1)
User.create(username: "default", password: "password", role: 0)
