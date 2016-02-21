class GetReadingListAction
  def initialize repository
    @repository = repository
  end

  def execute user_id
    reading_list = @repository.get_reading_list_for user_id
    reading_list.sort { |a, b| a.title <=> b.title }
  end
end
