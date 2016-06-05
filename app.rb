require 'bundler'
Bundler.require
require_relative 'Book'

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'bookstore',
  :username => 'postgres',
  :password => '1121'
)

get '/' do

end

get '/api/books' do
  Book.all.to_json
end

get '/api/book/:id' do
  puts params
  Book.find(params[:id]).to_json
end

post '/api/books' do
  puts params
  Book.create({
    :title => params[:title],
    :author => params[:author],
    :year => params[:year],
    :publisher => params[:publisher]
  }).to_json
end

patch '/api/books/:id' do
  book_args = { 
    :title => params[:title], 
    :author => params[:author], 
    :year => params[:year], 
    :publisher => params[:publisher]
  }

  @book = Book.find(params[:id])
  @book.update(book_args)
  @book.to_json

end

put '/api/books/:id' do
  book_args = { 
    :title => params[:title], 
    :author => params[:author], 
    :year => params[:year], 
    :publisher => params[:publisher]
  }

  @book = Book.find(params[:id])
  @book.update(book_args)
  @book.to_json

end

delete '/api/books/:id' do
  Book.destroy(params[:id]).to_json
end
