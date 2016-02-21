require_relative '../business/actions/actions'
require_relative '../business/book'

describe GetReadingListAction do

  before :each do
    @repository = double("Repository")
    @action = GetReadingListAction.new @repository
  end

  it 'should get that list ordered by title' do
    books = [Book.new("Title B", "Any"), Book.new("Title A", "Any")]
    allow(@repository).to receive(:get_reading_list_for).with('user id').and_return(books)

    reading_list = get_reading_list_for('user id')

    ordered_books = [Book.new("Title A", "Any"), Book.new("Title B", "Any")]
    expect(reading_list).to eq(ordered_books)
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
