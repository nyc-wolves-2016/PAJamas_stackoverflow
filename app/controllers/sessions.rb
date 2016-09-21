get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = 'Invalid Username or Password'
    erb :'/sessions/new'
  end
end

get '/sessions/logout' do
  session.clear
  redirect '/'
end
