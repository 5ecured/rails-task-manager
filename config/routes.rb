Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/tasks", to: "tasks#index", as: :index_task #read(all). also corresponds to the link_to in new.html.erb
  get "/tasks/new", to: "tasks#new", as: :new_task #create part one. here the AS part is really important as it will respond to the link_to in index.html.erb
  get "/tasks/:id", to: "tasks#show", as: :show_task #read(one). the AS corresponds  to the link to in index.html.erb. WITH /:ID, ALWAYS PUT IT AFTER THE NEW/CREATE/ETC. THE ORDER DOES MATTER
  get "/tasks/:id/edit", to: "tasks#edit", as: :edit_task
  patch "/tasks/:id", to:"tasks#update", as: :update_task
  post "/tasks", to: "tasks#create", as: :create_task #create part two
  delete "tasks/:id", to: "tasks#destroy", as: :destroy_task

end

=begin
for the "Get" part, IN GENERAL if an id exists, it means its only for one thing.
also you need to use lots of logic. for example:

line 4, you are creating a new task. so of course there is no id.
line 5, you are showing one task, so use id.
line 6, same as line 5. editing ONE task.
line 7, updating ONE task.
line 8, you are CREATING, no id cause you dont have one yet...
=end
