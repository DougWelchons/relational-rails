require 'rails_helper'

RSpec.describe OffroadVehicle, type: :model do
  describe "relationships" do
    it { should belong_to :member}
  end
end
