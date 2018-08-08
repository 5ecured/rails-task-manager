class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id]) #here i used @task because this method is only used to display  ONE task. so common sense.
  end

  def new
    @task = Task.new
  end

  def create
    # @task = Task.new(title: params["task"]['title'], details: params["task"]['details'])
    @task = Task.new(secure_params) #this corresponds to the method. which DOES protect us from HTML form manipulation/CSRF
    @task.save
    redirect_to index_task_path #this is to redirect to the index.
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(secure_params)
    redirect_to index_task_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to index_task_path
  end

  private

  def secure_params
    params.require(:task).permit(:title, :details)
  end

end

#line 15 works, but really long and does not protect us
#line 16: additionally the strong params also already specifies what its looking for - :title and :details
#line 40 this means we are only permitting/whitelisting title and details. if the user manipulates the HTML forms and adds admin
#for example, it still wont be accepted.
