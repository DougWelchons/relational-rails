class Book < ApplicationRecord
  belongs_to :library

  def self.available_books
    where(available: :true)
  end
end
