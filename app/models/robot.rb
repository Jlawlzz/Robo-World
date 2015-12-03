class Robot
  attr_reader :id,
              :name,
              :city,
              :state,
              :avatar,
              :birthdate,
              :date_hired,
              :department

  def initialize(data)
    @id          = data["id"]
    @name        = data["name"]
    @city        = data["city"]
    @state       = data["state"]
    @avatar      = data["avatar"]
    @birthdate   = data["birthdate"]
    @date_hired  = data["date hired"]
    @department  = data["department"]
  end

  def iterate_qualities
    [@city, @state, @birthdate, @date_hired, @department].each do |thing|
      thing
    end
  end

end
