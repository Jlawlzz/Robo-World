require 'yaml/store'
require_relative 'robot'

class RobotManager

  def self.database
    @database ||= YAML::Store.new("db/robot_manager")
  end

  def self.create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << { "name" => robot['name'], "city" => robot[:city], "state" => robot[:state], "avatar" => "https://robohash.org/#{robot['name']}", "birthdate" => robot[:birthdate], "date hired" => robot[:datehired], "department" => robot[:department]}
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

  def self.raw_robot(name)
   raw_robots.find { |robot| robot["name"] == name }
 end

  def self.find(name)
    Robot.new(raw_robot(name))
  end

  def self.update(name, data)
    database.transaction do
      target = database['robots'].find { |data| data["name"] == name }
      target["name"] = data[:name]
      target["department"] = data[:department]
    end
  end

  def self.delete(name)
    database.transaction do
      database['robots'].delete_if { |robot| robot["name"] == name }
    end
  end

end
