class GetReadingListAction
  def initialize repository
    @repository = repository
  end

  def execute user_id
    books = @repository.get_reading_list_for(user_id)
                        .sort_by { |book| book.title }
                        .map { |book| {title: book.title, author: book.author}}
  end
end

class AddBookToReadingListAction
  def initialize service
    @service = service
  end

  def execute user_id, book
    @service.add_book_to(user_id, book)
  end
end
