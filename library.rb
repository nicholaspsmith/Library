class Book
  attr_reader :title, :author, :description
  attr_accessor :status, :person, :time_out, :time_due

  def initialize title, author, description=""
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

	def initialize f_name, l_name=""
		@f_name = f_name
		@l_name = l_name
		@num_books = 0
	end
end


class Library

  def initialize
  	@books = []
  	@library = {}
  end

  def add book
  	@books << book
  end


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

  def check_in book, person
  	if (book.status == "Checked out")
  	  book.status = "Available"
  	  person.num_books -= 1
  	  book.person = nil
  	  book.time_out = nil
  	end
  end

  def check_status book
  	puts book.status
  end

  def check_books
  	@books.each do |book|
  		if book.status != "Available"
  		  puts "#{book.title} is #{book.status.downcase} by #{book.person.f_name} #{book.person.l_name}"
  		  puts "Due: #{book.time_due}"
  		end
  	end
  end

  def overdue_books
  	@books.each do |book|
  		if book.status == "Overdue"
  			puts "#{book.title} is overdue"
  		end
  	end
  end
end

