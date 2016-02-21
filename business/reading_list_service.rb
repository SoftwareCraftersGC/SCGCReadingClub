class ReadingListService
  def initialize repository
    @repository = repository
  end

  def add_book_to user_id, book
    @repository.add_book_to(user_id, book)
  end
end
