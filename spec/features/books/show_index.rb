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
    
    it "has a link to delete the book" do
      visit "/books/#{@cat.id}"
      
      expect(page).to have_link("Delete Book")
    end
    
    describe "when I click delete the link" do
      it "deletes the book and returns to books index page" do
        visit "/books/#{@cat.id}"

        click_on "Delete Book"

        expect(current_path).to eq("/books")

        expect(page).to have_no_content(@cat.name)
      end
    end
  end
end
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted
# and I am redirected to the child index page where I no longer see this child