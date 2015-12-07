require "sequel"
gem 'sqlite3'

environments = ["test", "development"]

environments.each do |env|
  Sequel.sqlite("db/robot_manager_#{env}.sqlite3").create_table(:robots) do
    primary_key :id
    String :name
    String :department
    String :city
    String :state
    String :birthdate
    String :date_hired
    String :avatar
  end
end
