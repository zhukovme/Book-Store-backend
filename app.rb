require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'bookstore'
)

get '/' do

	@book = Book.new
	@book.title = "The Great Book"
	@book.author = "Jon Bovi"
	@book.year = 1999
	@book.publisher = "Ya"
	@book.to_json

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
	book.destroy(params[:id]).to_json
end
