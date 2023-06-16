class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
 

  # Add your routes here
   # Login route
   post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      { message: 'Logged in successfully', user: user }.to_json
    else
      { error: 'Invalid email or password' }.to_json
    end
  end

  # Logout route
  delete '/logout' do
    session.clear
    { message: 'Logged out successfully' }.to_json
  end

  # Signup route
  post '/signup' do
    user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if user.valid?
      session[:user_id] = user.id
      { message: 'Signed up and logged in successfully', user: user }.to_json
    else
      { error: user.errors.full_messages.join(', ') }.to_json
    end
  end

# Events
  get "/events/:id" do
    event = Event.find(params[:id])
    event.to_json

  end

  get "/events" do
    event = Event.all.order(created_at: :desc)
    event.to_json
  end 


# Events 
  post "/events" do 
    event = Event.create(
      title: params[:title],
      description: params[:description],
      date: params[:date],
      location: params[:location],
      image_url: params[:image_url]
    )
    event.to_json
  end 

  patch "/events/:id" do
    event = Event.find(params[:id])
    event.update(
      title: params[:title],
      description: params[:description],
      date: params[:date],
      location: params[:location],
      image_url: params[:image_url]
    )
    event.to_json
  end 

  delete "/events/:id" do
    event = Event.find(params[:id])
    event.destroy
    event.to_json
  end 

  # reviews
  get "/reviews" do
    review = Review.all
    review.to_json
  end 

  post "/reviews" do
      review = Review.create(
        rating: params[:rating],
        comment: params[:comment],
        user_id: params[:user_id],
        event_id: params[:event_id]
      )
      review.to_json
  end   

  patch "/reviews/:id" do
    review = Review.find(params[:id])
    review.update(
      rating: params[:rating],
      comment: params[:comment]
    )
    review.to_json
  end 

  delete "/reviews/:id" do
    review = Review.find(params[:id])
    review.destroy
  end 

  # users
  get "/users" do
    user = User.all
    user.to_json
  end 

  post "/users" do
    user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    user.to_json
  end 

  patch "/users/:id" do
    user = User.find(params[:id])
    user.update(
      name: params[:name],
      email: params[:email]
    )
    user.to_json
  end 

  delete "/users/:id" do
    user = User.find(params[:id])
    user.destroy
    user.to_json
  end 
end