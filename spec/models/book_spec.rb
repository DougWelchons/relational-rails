require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "relationships" do
    it { should belong_to :library}
  end

  describe "Class Methods" do
    describe "::available_books" do
      it "only shows books that are available" do
        @library1 = Library.create!(name: "Lafayette Library", city: "Lafayette", years_open: 20, open: true)
        @library2 = Library.create!(name: "Broomfield Library", city: "Broomfield", years_open: 20, open: true)
        @cat = @library1.books.create!(name: "Cat in the Hat", available: true, pages: 61)
        @stand = @library1.books.create!(name: "The Stand", available: true, pages: 1308)
        @xmas = @library2.books.create!(name: "Christmas Carol", available: true, pages: 66)
        @war = @library2.books.create!(name: "War and Peace", available: false, pages: 1225)

        expected = [@cat, @stand, @xmas]

        expect(Book.available_books).to eq(expected)
      end
    end
  end
end
