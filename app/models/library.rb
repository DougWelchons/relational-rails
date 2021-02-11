class Library < ApplicationRecord
  has_many :books, :dependent => :destroy

  def self.recent_libraries
    order(created_at: :desc)
  end

  def self.by_number_of_books
    joins(:books).group('id').order('COUNT(books.id) DESC')
  end

  def number_of_books
    books.count
  end

  def available_books
    books.available_books
  end
end
