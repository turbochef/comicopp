module ComicsHelper
	
  def score
    self.get_upvotes.size - self.get_downvotes.size
  end
end
