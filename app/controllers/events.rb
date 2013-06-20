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


post '/delete_event' do 
  event = Event.find_by_id(params[:event_id])
  event.destroy 
  redirect '/events'
end

get '/edit/:event_id' do 
  @event = Event.find_by_id(params[:event_id])
  erb :edit
end

post '/edit_event' do 
  @event = Event.find_by_id(params[:event_id])
  Event.update(@event.id, params[:event])
  redirect '/events'
end
