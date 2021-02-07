require 'rails_helper'

RSpec.describe "Books Show Page" do
  before(:each) do
    @library1 = Library.create!(name: "Lafayette Library", city: "Lafayette")
    @library2 = Library.create!(name: "Broomfield Library", city: "Broomfield")
    
    @cat = @library1.books.create!(name: "Cat in the Hat", available: true, pages: 61)
    @stand = @library1.books.create!(name: "The Stand", available: true, pages: 1308)
    @xmas = @library2.books.create!(name: "Christmas Carol", available: true, pages: 66)
    @war = @library2.books.create!(name: "War and Peace", available: false, pages: 1225)
  end
  describe "a visitor" do
    it "shows the book and its attributes" do
      visit "/books/#{@cat.id}"

      expect(page).to have_content(@cat.name)
      expect(page).to have_content(@cat.pages)
      expect(page).to have_content(@cat.available)
    end
  end
end
