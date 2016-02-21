require_relative '../business/actions/actions'
require_relative '../business/book'

describe GetReadingListAction do

  before :each do
    @repository = double("Repository")
    @action = GetReadingListAction.new @repository
  end

  it 'should get that list ordered by title' do
    first_book = book_with "Title A"
    second_book = book_with "Title B"
    books = [second_book, first_book]
    allow(@repository).to receive(:get_reading_list_for).with('user id').and_return(books)

    reading_list = get_reading_list_for('user id')

    expect(reading_list).to eq([first_book, second_book])
  end

  def book_with title
    Book.new title, "Any"
  end

  def get_reading_list_for user_id
    @action.execute user_id
  end
end

# describe AddBookToReadingListAction do
#   it "should add a book to te user's list" do
#   end
#
#   it "should not add two books with same author and title" do
#   end
# end
#
# describe DeleteBookToReadingListAction do
#   it "should delete a book from the reading list of a user" do
#   end
# end
