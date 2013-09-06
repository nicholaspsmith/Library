

class Book
  attr_reader :title, :author, :description
  attr_accessor :status

  def initialize title, author
    @title = title
	@author = author
	@status = "Available"
  end

end

class Person
	attr_accessor :num_books
end


class Library

  # create @books hash that contains name of book and book object
  #
  # Example
  #   @books = {"Moby Dick" => book_obj1, "Pride and Prejudice" => book_obj2}
  #
  # create @checked_out hash that stores books that are checked out and by whome
  #
  # Example
  #   @checked_out = {"Moby Dick" => "Nick", "Ruby Design" => "Ami"}
  #
  def initialize
  	@books = {}
  	@checked_out = {}
  end


  # Add a book to our library
  #
  # title - String the title of our book
  #
  # 
  #
  #
  #
  def add title, author
  	@books[title] = Book.new(title, author)
  end


  # Print out list of currently available books
  #
  #
  #
  def list
  	puts "Available: "
  	@books.each do |key, value|
  	  if value.status == "Available"
  		puts key
  	  end
  	end
  	puts "Checked out: "
  	@checked_out.each do |key, value|
  	  if value != nil
  		puts "#{key} checked out by #{value}"
  	  end
  	end


  end
  # Allow user to check out book in 1 week intervals
  # -not allow user to check out more than two books
  # at a time.
  # -not let user check out if has overdue books
  #
  #
  #
  #
  #
  #
  def check_out book, person
  	if (@books[book].status == "Available")
  	  @checked_out[book] = person
  	  @books[book].status = "Out"
  	else
  		puts "That book is not currently in :("
    end
  end

  # Return a book to the @books 
  #
  #
  #
  #
  #
  def check_in book
  	if (@books[book].status == "Out")
  	  @books[book].status = "Available"
  	  @checked_out[book] = nil
  	  puts "You returned #{book}"
  	end
  end

end
