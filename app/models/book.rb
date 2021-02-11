class Book < ApplicationRecord
  belongs_to :library

  def self.available_books
    where(available: :true)
  end

  def self.search(search)
    if search
      self.where('pages > ?', search)
    else
      available_books
    end
  end

  def self.alphabetical
    order(name: :asc)
  end
end
