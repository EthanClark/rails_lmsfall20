roles = ['teacher', 'ta', 'student']
10.times do
  course = Course.create(
    name: Faker::Games::Zelda.game
  )
  5.times do
    user = User.create(
      first_name: Faker::Food.ingredient,
      last_name: Faker::Restaurant.name 
    )
    Enrollment.create(
      role: roles.sample,
      course_id: course.id,
      user_id: user.id
    )
  end
end