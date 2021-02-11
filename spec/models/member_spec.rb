require 'rails_helper'

RSpec.describe Member, type: :model do
  describe "relationships" do
    it { should have_many :offroad_vehicles }
  end

  describe "instance methods" do
    describe "#orv_list" do
      it "should return a set or subset of a members offroad vehicles" do

        member1 = Member.create!(name: "Doug", premium_member: true, skill_level: 3)
        vehicle1 = member1.offroad_vehicles.create!(name: "Black Sheep", make: "Jeep", model: "Wrangler", tire_size: 33, passed_safety_inspection: true)
        vehicle2 = member1.offroad_vehicles.create!(name: "Alligator", make: "Jeep", model: "Gladiator", tire_size: 37, passed_safety_inspection: true)

        expect(member1.orv_list).to eq([vehicle1, vehicle2])
        expect(member1.orv_list({tire_size: 35})).to eq([vehicle2])
        expect(member1.orv_list({sort: true})).to eq([vehicle2, vehicle1])
      end
    end
  end
end
