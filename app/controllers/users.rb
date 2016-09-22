post '/users/new' do
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      if response.xhr?
        JSON.parse(user)
      else
        redirect '/'
      end
    else
      @errors = user.errors.full_messages
      erb :'users/new'
    end
end
