 def total_votes
    votes.sum(:value)
  end