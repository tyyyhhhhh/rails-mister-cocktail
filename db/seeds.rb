# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)
Cocktail.destroy_all
Ingredient.destroy_all

Ingredient.create!(name: "lemon")
Ingredient.create!(name: "ice")
Ingredient.create!(name: "mint leaves")

Cocktail.create!(name: "Mint Julep")
Cocktail.create!(name: "Whiskey Sour")
Cocktail.create!(name: "Mojito")

require 'json'
require 'open-uri'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
cocktail_list_json = open(url).read
cocktail_list_hash = JSON.parse(cocktail_list_json)
cocktail_list = cocktail_list_hash["drinks"]


cocktail_list.each do | cocktail |
  # p cocktail
  p cocktail['strIngredient1']
  Ingredient.create!(name: cocktail["strIngredient1"])
end

Dose.create!(description: "minty",
  cocktail: Cocktail.all.sample,
  ingredient: Ingredient.all.sample
  )

Dose.create!(description: "saucy",
  cocktail: Cocktail.all.sample,
  ingredient: Ingredient.all.sample
  )

Dose.create!(description: "tangy",
  cocktail: Cocktail.all.sample,
  ingredient: Ingredient.all.sample
  )
