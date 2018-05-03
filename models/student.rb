require_relative('../db/sql_runner')

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house, :age

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options ['age'].to_i
  end

 ##instance methods

 def whole_name
   return "#{@first_name} #{@last_name}"
 end

  def save()
    sql = 'INSERT INTO students (first_name, last_name, house, age)
    VALUES ($1, $2, $3, $4)
    RETURNING id'
    values = [@first_name, @last_name, @house, @age]
    student = SqlRunner.run(sql, values)[0]
    @id = student['id'].to_i
  end

  def update()
    sql = 'UPDATE students
      SET (first_name, last_name, house, age)
      = ($1, $2, $3, $4) WHERE id = $5'
      values = [@first_name, @last_name, @house, @age]
      SqlRunner.run(sql, values)

 ##CLASS
  def self.all()
    sql = 'SELECT * FROM students'
    students = SqlRunner.run(sql)
    result = students.map  { |student| Student.new(student)}
    return result
  end

  def self.find(id)
    sql = 'SELECT * FROM students WHERE id = $1'
    values = [id]
    student = SqlRunner.run(sql, values)
    result = Student.new(student[0])
    return result
  end







end
