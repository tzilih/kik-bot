class Quote < ApplicationRecord
  @@total_quotes = Quote.count()

  def self.get_one
    Quote.find(rand(@@total_quotes) + 1).content
  end
end
