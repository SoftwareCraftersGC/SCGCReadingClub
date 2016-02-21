class Book
  attr_reader :title, :author

  def initialize title, author
    @title = title
    @author = author
  end

  def == anotherBook
    title == anotherBook.title and author == anotherBook.author
  end
end
