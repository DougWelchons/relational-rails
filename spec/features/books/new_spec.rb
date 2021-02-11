require 'rails_helper'

RSpec.describe "Books New Page" do
  before(:each) do
    @library1 = Library.create!(name: "Lafayette Library", city: "Lafayette")
  end

  describe "As a visitor" do
    describe "When I visit a Parent Childs Index page" do
      it "has a link to create a new book for that library" do
        visit "/libraries/#{@library1.id}/books"
        
        expect(page).to have_link("Create Book")
      end
      
      describe "When I click the link" do
        it "takes me to the new book page where I see the new book form" do
          visit "/libraries/#{@library1.id}/books"
          
          click_on "Create Book"
          
          expect(current_path).to eq("/libraries/#{@library1.id}/books/new")
          
          expect(page).to have_field(:name)
          expect(page).to have_field(:pages)
          expect(page).to have_field(:available)
        end
      end
      
      describe "When I fill in the form with the book's attributes and click 'Create Book'" do
        it "creates a book for that library, and returns to the libraries' books index page" do
          visit "/libraries/#{@library1.id}/books/new"

          fill_in :name, :with => "Green Eggs and Ham"
          fill_in :pages, :with => 62
          fill_in :available, :with => true

          click_on "Create Book"

          expect(current_path).to eq("/libraries/#{@library1.id}/books")

          expect(page).to have_content("Green Eggs and Ham")
          expect(page).to have_content(62)
          expect(page).to have_content(true)
        end
      end
    end
  end
end
