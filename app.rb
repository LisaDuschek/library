require('sinatra')
require('sinatra/reloader')
require('./lib/books')
require('./lib/patrons')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "library"})

get("/") do
  @books = Books.all()
  erb(:index)
end

get('/patrons') do
  @patrons = Patrons.all()
  erb(:patrons)
end

post("/patrons") do
  name = params.fetch("name")
  patron = Patrons.new({:name => name, :patron_id => nil})
  patron.save()
  erb(:patrons)
end

get("/patrons") do
  @patrons = Patrons.all()
  erb(:patrons)
end

get("/books_form") do
  @books = Books.all()
  erb(:books_form)
end

post("/books_form") do
  @books = Books.all()
  name = params.fetch("name")
  book = Books.new({:name => name, :id => nil})
  book.save()
  erb(:index)
end
