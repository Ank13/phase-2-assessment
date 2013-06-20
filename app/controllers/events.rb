get '/events' do
  @events = current_user.created_events
  erb :events
end


post '/events' do 
  
  Event.create :user_id    => current_user.id, 
               :name       => params[:event][:name],
               :location   => params[:event][:location],
               :starts_at => params[:event][:starts_at],
               :ends_at   => params[:event][:ends_at] 

  redirect '/events'
end
