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
  def save()
    sql = 'INSERT INTO hogwarts (first_name, last_name, house, age)
    VALUES ($1, $2, $3, $4)
    RETURNING id'
    values = [@first_name, @last_name, @house, @age]
    student = SqlRunner.run(sql, values)[0]
    @id = student['id'].to_i
  end

 ##CLASS
  def self.all()
    sql = 'SELECT * FROM hogwarts'
    hogwarts = SqlRunner.run(sql)
    result = hogwarts.map  { |student| Student.new(student)}
    return result
  end 






end
