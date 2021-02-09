require 'rails_helper'

RSpec.describe "Books Index Page" do
  before(:each) do
    @library1 = Library.create!(name: "Lafayette Library", city: "Lafayette", years_open: 10, open: false)
    @library2 = Library.create!(name: "Broomfield Library", city: "Broomfield", years_open: 20, open: false)

    @cat = @library1.books.create!(name: "Cat in the Hat", available: true, pages: 61)
    @stand = @library1.books.create!(name: "The Stand", available: true, pages: 1308)
    @xmas = @library2.books.create!(name: "Christmas Carol", available: true, pages: 66)
    @war = @library2.books.create!(name: "War and Peace", available: false, pages: 1225)
    @west = @library2.books.create!(name: "All Quiet on the Western Front", available: true, pages: 200)
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
        
      
      # within("#book-#{@war.id}") do
      #   expect(page).to have_content(@war.name)
      #   expect(page).to have_content(@war.available)
      #   expect(page).to have_content(@war.pages)
      #   expect(page).to have_content(@war.library.name)
      # end
    end
    
    it "only shows records where the boolean column is `true`" do
      visit "/libraries/#{@library2.id}/books"
      
      expect(page).to have_content(@xmas.name)
      expect(page).to have_no_content(@war.name)
    end
    
    it "has a link to edit the book" do
      visit "/books"
      
      within("#book-#{@stand.id}") do
        expect(page).to have_link("Edit Book")
        click_on "Edit Book"
        expect(current_path).to eq("/books/#{@stand.id}/edit")
      end
    end
    
    it "has a link to delete the book" do
      visit "/books"

      within("#book-#{@stand.id}") do
        expect(page).to have_link("Delete Book")
        click_on "Delete Book"
        expect(current_path).to eq("/books")
      end
      
      expect(page).to_not have_content(@stand.name)
    end
    it "has a link to All Books" do
      visit "/books"

      expect(page).to have_link("All Books")
    end
  end
  
  describe "library's books index page" do
    it "has a form to put a number value" do
      visit "/libraries/#{@library2.id}/books"

      expect(page).to have_field(:search)
    end
    it "only returns and shows the records with more than that number" do
      visit "/libraries/#{@library2.id}/books"
      
      fill_in :search, :with => 1000
      
      click_on "Only return books with a number of pages greater than"
      
      expect(current_path).to eq("/libraries/#{@library2.id}/books")
      
      expect(page).to have_content(@war.name)
      expect(page).to_not have_content(@xmas.name)
    end

    it "has a link to sort books in alphabetical order" do
      visit "/libraries/#{@library2.id}/books"
      
      expect(page).to have_link("Sort Alphabetically")
      
      click_on "Sort Alphabetically"
      
      expect(current_path).to eq("/libraries/#{@library2.id}/books/sort")
    end
    
    describe "When I click on the link" do
      it "takes me back to the index page with books in alphabetical order" do
        visit "/libraries/#{@library2.id}/books"
        
        click_on "Sort Alphabetically"
        
        expect(@west.name).to appear_before(@xmas.name)
        expect(@xmas.name).to appear_before(@war.name)
      end
    end
    
    it "has a link to edit the book" do
      visit "/libraries/#{@library1.id}/books"

      within("#book-#{@stand.id}") do
        expect(page).to have_link("Edit Book")
        click_on "Edit Book"
        expect(current_path).to eq("/books/#{@stand.id}/edit")
      end
    end
    
    it "has a link to delete the book" do 
      visit "/libraries/#{@library1.id}/books"
      
      within("#book-#{@stand.id}") do
        expect(page).to have_link("Delete Book")
        click_on "Delete Book"
        expect(current_path).to eq("/books")
      end

      expect(page).to_not have_content(@stand.name)
    end

    it "has a link to All Books" do
      visit "/libraries/#{@library1.id}/books"

      expect(page).to have_link("All Books")
    end
  end
end