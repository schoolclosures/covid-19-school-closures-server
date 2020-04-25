5.times do 
  Volunteer.create(
    image_url: Faker::Internet.url,
    name: Faker::Name.name,
    job_desc: Faker::Lorem.sentence
  )
end
