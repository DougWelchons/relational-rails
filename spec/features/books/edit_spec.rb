require 'rails_helper'

RSpec.describe "Books editing Page" do
  before(:each) do
    @library1 = Library.create!(name: "Lafayette Library", city: "Lafayette")

    @cat = @library1.books.create!(name: "Cat in the Hat", available: true, pages: 61)
  end

  describe "As a visitor" do
    describe "When I visit a Book Show page" do
      it "has a link to update that book" do
        visit "/books/#{@cat.id}"
        
        expect(page).to have_link("Update Book")
      end
    end
  end

  describe "When I click the link" do
    it "takes me to the edit page with a form to update the book" do
      visit "/books/#{@cat.id}"
      
      click_on "Update Book"
      
      expect(current_path).to eq "/books/#{@cat.id}/edit"
      
      expect(page).to have_field(:name)
      expect(page).to have_field(:pages)
      expect(page).to have_field(:available)
    end
  end
  
  describe "When fill in the form and click the Update button" do
    it "redirects me to the book's Show page where I see the books's updated information" do
      visit "/books/#{@cat.id}/edit"
      
      fill_in :name, :with => "Green Eggs and Ham"
      fill_in :pages, :with => 62
      fill_in :available, :with => false

      click_on "Update Book"

      expect(page).to have_content("Green Eggs and Ham")
      expect(page).to have_content(62)
      expect(page).to have_content("false")

      expect(page).to have_no_content("true")
      expect(page).to have_no_content(61)
      expect(page).to have_no_content("Cat in the Hat")
      end
    end
end

# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,