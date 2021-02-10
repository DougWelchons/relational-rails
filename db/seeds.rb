OffroadVehicle.destroy_all
Member.destroy_all

doug = Member.create!(name: "Doug", skill_level: 3, premium_member: true)
emma = Member.create!(name: "Emma", skill_level: 3, premium_member: false)
clark = Member.create!(name: "Clark", skill_level: 5, premium_member: true)
jason = Member.create!(name: "Jason", skill_level: 1, premium_member: false)
sandy = Member.create!(name: "Sandy", skill_level: 2, premium_member: true)

doug.offroad_vehicles.create!(name: "Black Sheep", make: "Jeep", model: "Wrangler", tire_size: 33, passed_safety_inspection: true)
doug.offroad_vehicles.create!(name: "Dragon-Alligator", make: "Jeep", model: "Gladiator", tire_size: 37, passed_safety_inspection: true)
emma.offroad_vehicles.create!(name: "Monster", make: "Jeep", model: "Cherokee", tire_size: 30, passed_safety_inspection: false)
clark.offroad_vehicles.create!(name: "Alex", make: "Mercede", model: "G63 AMG 6x6", tire_size: 45, passed_safety_inspection: true)
clark.offroad_vehicles.create!(name: "BigBoi", make: "Ford", model: "F-250", tire_size: 37, passed_safety_inspection: false)
sandy.offroad_vehicles.create!(name: "Mud Pie", make: "Chevy", model: "Silverado", tire_size: 30, passed_safety_inspection: true)
