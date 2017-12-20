require 'byebug'

class Employee
attr_accessor :boss
attr_reader :salary, :name
  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss = nil)
    super
    @employees = []
  end

  def add_employees
    @employees = []
    # debugger
    Employee.all.each do |employee|
      next if employee.name == @name
      next if employee.name == @boss
      next if @employees.include?(employee)
      @employees << employee if employee.boss == @name
      @employees.concat(employee.add_employees) if employee.is_a? Manager
    end
    @employees
  end

  def bonus(multiplier)
    add_employees
    total = 0
    @employees.each do |employee|
      total += employee.salary
    end
    total * multiplier
  end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, "Ned")
shawna = Employee.new("Shawna", "TA", 12000, "Darren")
david = Employee.new("David", "TA", 10000, "Darren")

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
