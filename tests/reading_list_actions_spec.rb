require_relative '../business/actions/actions'
require_relative '../business/book'
require_relative '../business/reading_list_service'

describe GetReadingListAction do

  before :each do
    @repository = double("Repository")
    @action = GetReadingListAction.new @repository
  end

  it 'should respond to the execute message' do
    expect(@action).to respond_to(:execute)
  end

  it 'should get that list ordered by title' do
    first_book = book_with "Title A"
    second_book = book_with "Title B"
    allow(@repository).to receive(:get_reading_list_for).with('user id')
                      .and_return([second_book, first_book])

    reading_list = get_reading_list_for('user id')

    expect(reading_list).to eq([first_book, second_book])
  end

  def book_with title
    {'title' => title}
  end

  def get_reading_list_for user_id
    @action.execute user_id
  end
end

describe AddBookToReadingListAction do
  before :each do
    @repository = spy('Repository')
    service = ReadingListService.new @repository
    @action = AddBookToReadingListAction.new service
  end

  it 'should respond to the execute message' do
    expect(@action).to respond_to(:execute)
  end

  it "should add a book to te user's list" do
    add_book_to_user 'user id', :book

    expect(@repository).to have_received(:add_book_to).with('user id', :book)
  end

  xit "should not add two books with same author and title" do
  end

  def add_book_to_user user_id, book
    @action.execute user_id, book
  end
end
#
# describe DeleteBookToReadingListAction do
#   it "should delete a book from the reading list of a user" do
#   end
# end
