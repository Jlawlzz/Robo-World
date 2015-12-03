require 'yaml/store'

class RobotManager

  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= Sequel.sqlite("db/robot_manager_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/robot_manager_development.sqlite3")
    end
  end

  def self.create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << { "id" => database['total'],
                              "name" => robot[:name],
                              "city" => robot[:city],
                              "state" => robot[:state],
                              "avatar" => "https://robohash.org/#{robot['name']}",
                              "birthdate" => robot[:birthdate],
                              "date hired" => robot[:datehired],
                              "department" => robot[:department]}
    end
  end

  def self.raw_robots
     database.transaction do
       database['robots'] || []
     end
  end

  def self.all
     raw_robots.map { |data| Robot.new(data) }
  end

  def self.raw_robot(id)
   raw_robots.find { |robot| robot["id"] == id}
 end

  def self.find(id)
    Robot.new(raw_robot(id))
  end

  def self.update(id, data)
    database.transaction do
      target = database['robots'].find { |data| data["id"] == id }
      target["name"] = data[:name]
      target["department"] = data[:department]
      target["birthdate"] = data[:birthdate]
      target["date hired"] = data[:date_hired]
      target["city"] = data[:city]
      target["state"] = data[:state]
      target["avatar"] = "robohash.org/#{data[:name]}"
    end
  end

  def self.delete(id)
    database.transaction do
      database['robots'].delete_if { |robot| robot["id"] == id }
    end
  end

  def self.delete_all
    database.transaction do
      database['robots'] = []
      database['total'] = 0
    end
  end

end
