Place.destroy_all
User.destroy_all

10.times.each do |index|
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "12345678"
  )
end

User.all.each do |user|
  10.times.each do |index|
    place = Place.new(
      street: Faker::Address.street_name,
      user_id: user.id
    )
    if place.geocode && place.save
      User.where.not(id: user.id).each do |user1|
        place.users << user1
      end
    end
  end
end

