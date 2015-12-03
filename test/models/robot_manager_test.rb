require_relative "../test_helper"

class RobotManagerTest < Minitest::Test

  def create_robots(number)
    number.times do |i|
      RobotManager.create({name: "#{i + 1}", department: "#{i + 1}", date_hired: "#{i + 1}", city: "#{i + 1}", state: "#{i + 1}", birthdate: "#{i + 1}"})
    end
  end

  def test_it_creates_a_robot
    create_robots(1)

    robot = RobotManager.find(1)

    assert_equal "1", robot.name
  end
  # 
  # def test_it_returns_all_robots
  #   create_robots(3)
  #
  #   robots = RobotManager.all
  #   names = ['1', '2', '3']
  #   descriptions = ['1', '2', '3']
  #   ids = [1, 2, 3]
  #
  #   assert_equal 3, robots.count
  #   assert_equal'1', robots[0].name
  #   assert_equal names, robots.map { |robot| robot.name }
  #   assert_equal descriptions, robots.map { |robot| robot.department}
  #   assert_equal ids, robots.map { |robot| robot.id }
  # end
  #
  # def test_finds_one_robot
  #   create_robots(3)
  #
  #   assert_equal "2", RobotManager.find(2).department
  # end
  #
  # def test_it_updates_an_entry
  #   create_robots(3)
  #
  #   RobotManager.update(2, {:name => "Bob"})
  #
  #   assert_equal "Bob", RobotManager.find(2).name
  # end
  #
  # def test_it_returns_nil_for_empty_update_field
  #   create_robots(3)
  #
  #   RobotManager.update(2, {:department => "junk"})
  #
  #   assert_equal "junk", RobotManager.find(2).department
  #   assert_equal nil, RobotManager.find(2).name
  # end
  #
  # def test_it_deletes_an_entry
  #     create_robots(3)
  #
  #   RobotManager.delete(2)
  #
  #   robots = RobotManager.all
  #   names = ["1", "3"]
  #   departments = ["1", "3"]
  #   ids = [1,3]
  #
  #   assert_equal 2, robots.count
  #   assert_equal "1", robots[0].name
  #   assert_equal names, robots.map { |robot| robot.name }
  #   assert_equal departments, robots.map { |robot| robot.department }
  #   assert_equal ids, robots.map { |robot| robot.id }
  # end

end
