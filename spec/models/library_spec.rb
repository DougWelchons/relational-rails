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
end
