require_relative('../models/student')
require('pry-byebug')


student1 = Student.new({
  'first_name' => 'Iain',
  'last_name' => 'Rogerson',
  'house' => 'Gryffindor',
  'age' => 12
})
student1.save()

student2 = Student.new({
  'first_name' => 'Paul',
  'last_name' => 'Stevenson',
  'house' => 'Slytherin',
  'age' => 11
})
student2.save()

student3 = Student.new({
  'first_name' => 'Ryan',
  'last_name' => 'Gosling',
  'house' => 'Hufflepuff',
  'age' => 13
})
student3.save()

student4 = Student.new({
  'first_name' => 'Jessica',
  'last_name' => 'Chastain',
  'house' => 'Ravenclaw',
  'age' => 12
})
student4.save()

binding.pry
nil
