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
