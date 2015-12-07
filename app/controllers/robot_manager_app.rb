require 'pony'

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
    id = RobotManager.create(params[:robot])
    @robot = RobotManager.find(id.to_i)
    Pony.mail({ :to => 'jordan.lawler@colorado.edu',
              :from => 'jordanalawler@gmail.com',
              :subject => 'You have created a new ROBO-SLAVE',
              :body => erb(:email, :layout => false)})
    redirect '/robots'
  end

# read
  get '/robots/:id' do |id|
   @robot = RobotManager.find(id.to_i)
   erb :show
  end

  get '/robots/:id/edit' do |id|
    @robot = RobotManager.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    RobotManager.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
   RobotManager.delete(id.to_i)
   redirect '/robots'
  end

  not_found do
    erb :error
  end

end
