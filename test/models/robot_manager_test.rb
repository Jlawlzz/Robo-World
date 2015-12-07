require_relative "../test_helper"

class RobotManagerTest < Minitest::Test

  def create_robots(number)
    number.times do |i|
      RobotManager.create({name: "#{i + 1}",
                           department: "#{i + 1}",
                           date_hired: "#{i + 1}",
                           city: "#{i + 1}",
                           state: "#{i + 1}",
                           birthdate: "#{i + 1}"})
    end
  end

  def test_it_creates_a_robot
    create_robots(1)

    robot = RobotManager.all.last

    assert_equal "1", robot.name
    assert_equal "1", robot.department
  end

  def test_it_returns_all_robots
    create_robots(3)

    robots = RobotManager.all[-3..-1]
    names = ['1', '2', '3']
    descriptions = ['1', '2', '3']

    assert_equal 3, robots.count
    assert_equal'1', robots[0].name
    assert_equal names, robots.map { |robot| robot.name }
    assert_equal descriptions, robots.map { |robot| robot.department}
  end

  def test_finds_one_robot
    create_robots(3)

    robot = RobotManager.all[-2]

    assert_equal "2", RobotManager.find(robot.id).department
  end

  def test_it_updates_an_entry
    create_robots(3)

    id = RobotManager.all[-2].id

    RobotManager.update(id, {:name => "Bob"})

    assert_equal "Bob", RobotManager.find(id).name
  end

  def test_it_deletes_an_entry
      create_robots(3)

    id = TaskManager.all[-2]
    
    RobotManager.delete(id)

    robots = RobotManager.all
    names = ["1", "3"]
    departments = ["1", "3"]
    ids = [1,3]

    assert_equal 2, robots.count
    assert_equal "1", robots[0].name
    assert_equal names, robots.map { |robot| robot.name }
    assert_equal departments, robots.map { |robot| robot.department }
    assert_equal ids, robots.map { |robot| robot.id }
  end

end
