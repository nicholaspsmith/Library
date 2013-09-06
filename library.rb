class Book
  attr_reader :title, :author, :description
  attr_accessor :status, :person, :time_out, :time_due, :year_published, :edition

  # Creates an instance of the Book class
  #
  # title - String book title
  # author - String book author
  # description - optional String
  # year_published - optional String
  # edition - optional String
  #
  # Examples
  #   book1 = Book.new("Moby Dick","Herman Melville")
  #   book2 = Book.new("The Bible", "Various", "A holy book", "30AD")
  #   book3 = Book.new("Ruby Programming", "Bill Finnegan", "Ruby programming basics", "2009", 3)
  #
  # Returns a new book object
  def initialize title, author, description="", year_published="", edition=1
    @title = title
	@author = author
	@status = "Available"
	@description = description
	@person = nil
  end
end

class Person
	attr_accessor :num_books
	attr_reader :f_name, :l_name

	# Create a person object
	#
	# f_name - String first name
	# l_name - optional String last name
	#
	# Examples
	#   nick = Person.new("Nick","Smith")
	#   bob = Person.new("Bob")
	#
	# Returns a new person object
	def initialize f_name, l_name=""
		@f_name = f_name
		@l_name = l_name
		@num_books = 0
	end
end


class Library

require 'csv'

  # Create a new library object
  #
  # @books - array of books contained in library initializes to empty array
  #
  # Example
  #   library = Library.new
  #
  # Returns an empty library object containing empty @books array
  def initialize
  	@books = []
  end

  def add book
  	@books << book
  end


  # Prints all books and their status
  #
  # No return value
  def list
  	puts "Available: "
  	@books.each do |book|
  	  if book.status == "Available"
  	    puts book.title
  	  end
  	end

  	puts "Checked out: "
  	@books.each do |book|
  	  if book.status != "Available"
  	    puts book.title
  	  end
  	end
  end

  # Allow person to check book out from library if following conditions are met:
  # -person does not have overdue book
  # -person has fewer than 2 books checked out already
  # -book is not already checked out
  #
  # book - Book object to be checked out
  # person - Person object who desires to check out book
  #
  # Example
  #   library.check_out moby_dick, nick
  #
  #
  # No return value
  def check_out book, person
  	has_overdue = false
  	@books.each do |book|
  	  		if book.person == person
  	  			has_overdue = true;
  	  		end
  	  	end
  	if (book.status == "Available")
  		if (!has_overdue)
	  	  if (person.num_books < 2) ## and has no overdue books
	  	    person.num_books += 1
	  	    book.status = "Checked out"
	  	    book.person = person
	  	    book.time_out = Time.now
	  	    book.time_due = Time.now + (7*24*60*60)
	  	  else
	  	  	puts "You already have 2 books checked out"
	  	  end
	  	else
	  		puts "You have an overdue book"
	  	end
  	else
  		puts "That book is not available"
    end
  end

  # Allows person to return book to library
  #
  # book - Book object to be returned
  # person - Person object who currently has book 
  #
  # Example
  #   library.check_in moby_dick, nick
  #
  # No return value
  def check_in book, person
  	if (book.status == "Checked out")
  	  book.status = "Available"
  	  person.num_books -= 1
  	  book.person = nil
  	  book.time_out = nil
  	end
  end

  # Shows status of book
  #
  # book - Book object to check status of
  def check_status book
  	puts book.status
  end

  # Check books that are not available
  # Prints out title, status, and name of the person who has book
  # also prints due date
  def check_books
  	@books.each do |book|
  		if book.status != "Available"
  		  puts "#{book.title} is #{book.status.downcase} by #{book.person.f_name} #{book.person.l_name}"
  		  puts "Due: #{book.time_due}"
  		end
  	end
  end

  # Prints out titles of all overdue books
  def overdue_books
  	@books.each do |book|
  		if book.status == "Overdue"
  			puts "#{book.title} is overdue"
  		end
  	end
  end

  # Import books from .csv file
  def import 
  	File.open("books.csv").read.split("\n").each do |line|
  		title, author, description, year_published, edition = line.split(" ")
  		@books << Book.new(title, author, description, year_published, edition)
  	end

  end
end

