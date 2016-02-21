require_relative '../business/actions/actions'

describe GetReadingListAction do

  before :each do
    @repository = double("Repository")
    @action = GetReadingListAction.new @repository
  end

  it 'should get the reading list for a existing user' do
    allow(@repository).to receive(:get_reading_list_for).with('user id').and_return([:book])
    reading_list = @action.execute('user id')
    expect(reading_list).to eq([:book])
  end

  it 'should get that list ordered alphabetically' do
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
