require 'models/robot_manager'

class RobotManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    erb :dashboard
  end

# read
  get '/robots' do
   @robots = RobotManager.all
   erb :directory
  end

# create (first half)
  get '/robots/new' do
    erb :new
  end

# create (second half)
  post '/robots' do
    RobotManager.create(params[:robot])
    redirect '/robots'
  end

# read
  get '/robots/:name' do |name|
   @robot = RobotManager.find(name)
   erb :show
  end

  get '/robots/:name/edit' do |name|
    @robot = RobotManager.find(name)
    erb :edit
  end

  put '/robots/:name' do |name|
    RobotManager.update(name, params[:robot])
    redirect "/robots/#{name}"
  end

  delete '/robots/:name' do |name|
   RobotManager.delete(name)
   redirect '/robots'
  end

  not_found do
    erb :error
  end

end
