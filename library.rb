

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
	attr_reader :name

	def initialize name
		@name = name
		@num_books = 0
	end
end


class Library

  # create @books array that represents all of our books
  #
  # Example
  #   @books = ['Moby Dick', 'Ruby Programming', 'The bible']
  #
  #
  #
  # create @library hash that links titles to books for searching
  #
  # Example
  #   @library = {"Moby Dick" => moby_dick, "Ruby Programming" => ruby}
  #
  #
  # create @checked_out array
  #
  # Example
  #   @checked_out = ['Moby Dick', 'The Odyssey']
  #
  #
  #
  def initialize
  	@books = []
  	@library = {}
  	@people = {}
  	populate
  	add_people
  end

  # fills library with books
  def populate
  	moby_dick = Book.new("Moby Dick", "Herman Melville")
  	bible = Book.new("The Holy Bible", "Various Authors")
  	ruby = Book.new("Ruby on Rails Guide", "Bob Jones")
  	@books.push(moby_dick)
  	@books.push(bible)
  	@books.push(ruby)

  	@books.each do |book|
  		@library[book.title] = book
  	end
  end

  # Creates a bunch of people that can check out books
  def add_people
  	persons = []
  	nick = Person.new("Nick")
  	mike = Person.new("Mike")
  	persons << nick
  	persons << mike
  	persons.each do |obj|
  		@people[obj.name] = obj
  	end
  end

  def list_people
  	@people.each do |key, value|
  		puts key
  	end
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
  	@library[title] = Book.new(title, author)
  	@books << @library[title]
  end


  # Print out list of currently available books
  #
  #
  #
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
  def check_out title, name
  	book = @library[title]
  	person = @people[name]
  	
  	if (book.status == "Available")
  	  if (person.num_books < 2)
  	    person.num_books += 1
  	    book.status = "Out"
  	  end
  	else
  		puts "That book is not available"
    end
  end

  # Return a book to the @books 
  #
  #
  #
  #
  #
  def check_in book
  	if (book.status == "Out")
  	  book.status = "Available"
  	end
  end

end
