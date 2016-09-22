class Book
  def initialize(name)
    @name = name
  end
  attr_reader :name
end

class BookShelf
  def initialize()
    @books = Array.new()
  end
  def [](index)
    return @books[index]
  end
  def append_book(book)
    @books << book
  end
  def length
    return @books.length
  end
  def interator
    return BookShelfIterator.new(self)
  end
end

class BookShelfIterator
  def initialize(bookshelf)
    @bookShelf = bookshelf
    @index = 0
  end
  def has_next?()
    @index < @bookShelf.length
  end
  def next()
    book = @bookShelf[@index]
    @index += 1
    return book
  end
end
if __FILE__ == $0
  bookShelf = BookShelf.new()
  bookShelf.append_book(Book.new("Around the World in 80 Days"))
  bookShelf.append_book(Book.new("Bible"))
  bookShelf.append_book(Book.new("Cinderella"))
  bookShelf.append_book(Book.new("Daddy-Long-Legs"))
  it = bookShelf.interator()
  while it.has_next?
    book = it.next()
    print book.name, "\n"
  end
end
puts File.dirname(__FILE__)
puts $0
