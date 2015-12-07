
class RobotManager

  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= Sequel.sqlite("db/robot_manager_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/robot_manager_development.sqlite3")
    end
  end

  def self.create(robot)
    database.from(:robots).insert(name: robot[:name],
                                                department: robot[:department],
                                                city: robot[:city],
                                                state: robot[:state],
                                                date_hired: robot[:date_hired],
                                                birthdate: robot[:birthdate],
                                                avatar: "http//robohash.org#{robot[:name]}")
  end

  def self.all
    raw_robots = database.from(:robots).to_a
    raw_robots.map { |data| Robot.new(data) }
  end

  def self.find(id)
    data = database.from(:robots).where(id: id).to_a.first
    Robot.new(data)
  end

  def self.update(id, data)
    database.from(:robots).where(id: id).update(data)
  end

  def self.delete(id)
    database.from(:robots).where(:id=>id).delete
  end
end
