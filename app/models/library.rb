class Library < ApplicationRecord
  has_many :books, :dependent => :destroy

  def self.recent_libraries
    order(created_at: :desc)
  end

  def number_of_books
    books.count
  end

  def available_books
    books.available_books
  end
end
