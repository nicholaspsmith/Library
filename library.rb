class Book
  attr_reader :title, :author, :description
  attr_accessor :status

  def initialize title author
  	@title = title
  	@author = author
  end

end

class Library

  # create @books hash that contains name of book and book object
  #
  # Example
  #   @books = {"Moby Dick" => book_obj1, "Pride and Prejudice" => book_obj2}
  #
  def initialize
  	@books = {}
  end


  # Add a book to our library
  #
  # title - String the title of our book
  #
  # 
  #
  #
  #
  def add title author
  	@books[title] = Book.new(title, author)
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
  def check_out book
  end

  # Determines which person has checked out a given book
  #
  #
  #
  #
  #
  def checked_out_by person
  end

  #
  #
  #
  #
  #
  #
  def check_in book
  end

end
