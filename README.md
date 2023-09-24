# Cocktail Helper

You can search for a cocktail to get the ingredients and the steps to make it.
You can search by ingredient, the first letter of the name, you can get a random cocktail
You can even choose from alcoholic or non-alcoholic drinks

Use this repository to create new Sinatra apps. 

Optionally, to use `ActiveRecord` for database operations, add to the `app.rb`:

```ruby
require "sinatra/activerecord"
```

And in the `config/environment.rb` file add this code block:

```ruby
configure do
  # setup a database connection
  set(:database, { adapter: "sqlite3", database: "db/development.sqlite3" })
end
```
