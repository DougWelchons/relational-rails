require 'rails_helper'

RSpec.describe Library, type: :model do
  describe "relationships" do
    it { should have_many :books}
  end

  describe "Class Methods" do
    describe "::recent_libraries" do
      it "lists libraries by most recently created" do
        @library1 = Library.create!(name: "Lafayette Library", city: "Lafayette", years_open: 20, open: true)
        @library2 = Library.create!(name: "Broomfield Library", city: "Broomfield", years_open: 20, open: true)
        @library3 = Library.create!(name: "Denver Library", city: "Denver", years_open: 20, open: true)
        
        expected = [@library3, @library2, @library1]
        
        expect(Library.recent_libraries).to eq(expected)
      end
    end
  end

  describe "Instance Methods" do
    describe "#number_of_books" do
      it "returns the number of books belonging to the library" do
        @library1 = Library.create!(name: "Lafayette Library", city: "Lafayette", years_open: 20, open: true)
        @library2 = Library.create!(name: "Broomfield Library", city: "Broomfield", years_open: 20, open: true)
        @cat = @library1.books.create!(name: "Cat in the Hat", available: true, pages: 61)
        @stand = @library1.books.create!(name: "The Stand", available: true, pages: 1308)
        @xmas = @library2.books.create!(name: "Christmas Carol", available: true, pages: 66)
        @war = @library2.books.create!(name: "War and Peace", available: false, pages: 1225)

        expect(@library1.number_of_books).to eq(2)
      end
    end

    describe "#available_books" do
      it "only shows books that are available" do
        @library1 = Library.create!(name: "Lafayette Library", city: "Lafayette", years_open: 20, open: true)
        @library2 = Library.create!(name: "Broomfield Library", city: "Broomfield", years_open: 20, open: true)
        @cat = @library1.books.create!(name: "Cat in the Hat", available: true, pages: 61)
        @stand = @library1.books.create!(name: "The Stand", available: true, pages: 1308)
        @xmas = @library2.books.create!(name: "Christmas Carol", available: true, pages: 66)
        @war = @library2.books.create!(name: "War and Peace", available: false, pages: 1225)

        expected = [@xmas]

        expect(@library2.available_books).to eq(expected)
      end
    end
  end
end
