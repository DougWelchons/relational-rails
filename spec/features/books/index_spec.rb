require 'rails_helper'

RSpec.describe "Books Index Page" do
  before(:each) do
    @library1 = Library.create!(name: "Lafayette Library", city: "Lafayette", years_open: 10, open: false)
    @library2 = Library.create!(name: "Broomfield Library", city: "Broomfield", years_open: 20, open: false)

    @cat = @library1.books.create!(name: "Cat in the Hat", available: true, pages: 61)
    @stand = @library1.books.create!(name: "The Stand", available: true, pages: 1308)
    @xmas = @library2.books.create!(name: "Christmas Carol", available: true, pages: 66)
    @war = @library2.books.create!(name: "War and Peace", available: false, pages: 1225)
  end
  describe "as a vistor" do
    it "shows all the books in the system and their attributes" do
      visit "/books"

      within("#book-#{@cat.id}") do
        expect(page).to have_content(@cat.name)
        expect(page).to have_content(@cat.available)
        expect(page).to have_content(@cat.pages)
        expect(page).to have_content(@cat.library.name)
      end

      within("#book-#{@stand.id}") do
        expect(page).to have_content(@stand.name)
        expect(page).to have_content(@stand.available)
        expect(page).to have_content(@stand.pages)
        expect(page).to have_content(@stand.library.name)
      end
      
      within("#book-#{@xmas.id}") do
        expect(page).to have_content(@xmas.name)
        expect(page).to have_content(@xmas.available)
        expect(page).to have_content(@xmas.pages)
        expect(page).to have_content(@xmas.library.name)
      end
        
        
      within("#book-#{@war.id}") do
        expect(page).to have_content(@war.name)
        expect(page).to have_content(@war.available)
        expect(page).to have_content(@war.pages)
        expect(page).to have_content(@war.library.name)
      end

    end
  end
end