require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
  erb(:home)
end

get("/ingredient") do
  erb(:ingredient)
end

get("/ingredient_result")do
  @ingredient = params.fetch("ingredient").to_s
  url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{@ingredient}"
  @conversion_data = JSON.parse(HTTP.get(url))
  @drinks = @conversion_data['drinks']

  erb(:ingredient_result)
end

get("/first_letter")do

  erb(:first_letter)
end

get("/first_letter_result")do
  @letter = params.fetch("letter").to_s
  url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=#{@letter}"
  @conversion_data = JSON.parse(HTTP.get(url))
  @drinks = @conversion_data['drinks']
  

  erb(:first_letter_result)
end

get("/random")do
  url = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
  @conversion_data = JSON.parse(HTTP.get(url))
  @drinks = @conversion_data['drinks']
  @image = @drinks.first.fetch("strDrinkThumb").to_s
  @image = @image + "/preview"

  @ingredients = []
  num_of_ingredients = 1
  until num_of_ingredients == 15 do
    @ingredients.push(@drinks.first.fetch("strIngredient#{num_of_ingredients}"))
    num_of_ingredients = num_of_ingredients + 1
  end
  @measure = []
  num_of_measurements = 1
  until num_of_measurements == 15 do
    @measure.push(@drinks.first.fetch("strMeasure#{num_of_measurements}"))
    num_of_measurements = num_of_measurements + 1
  end
  @ingredients.compact!
  @measure.compact!
  erb(:random)
end

get("/name") do
  erb(:name)
end

get("/name_result") do
  @drink_name = params.fetch("name").to_s
  url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?i={#@drink_name}"
  @conversion_data = JSON.parse(HTTP.get(url))
  @drinks = @conversion_data['drinks']
  
  erb(:name_result)
end
