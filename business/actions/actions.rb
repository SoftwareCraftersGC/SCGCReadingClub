class GetReadingListAction
  def initialize repository
    @repository = repository
  end

  def execute user_id
    @repository.get_reading_list_for(user_id).sort_by { |book| book.title}
  end
end
