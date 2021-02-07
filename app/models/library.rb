class Library < ApplicationRecord
  has_many :books

  def self.recent_libraries
    order(created_at: :desc)
  end
end
