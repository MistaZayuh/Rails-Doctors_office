specialties = ["optometry", "dentistry", "general practitioner"]
10.times do
  doctor = Doctor.create(
    name: Faker::FunnyName.name,
    specialty: specialties.sample
  )
  5.times do 
    user = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )
    Appointment.create(
    time: Faker::Time.forward(days: 5,  period: :evening, format: :long),
    user_id: user.id,
    doctor_id: doctor.id
      )
  end
end

puts "Data Seeded"