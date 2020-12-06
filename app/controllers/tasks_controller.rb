class TasksController < ApplicationController
　def index
    @task = Task.all
  end

  def show
  end

  def new
  end

  def create
    @message = Message.new(message_params)
      if @task.save
      flash[:success] = 'Task が正常に保存されました'
      redirect_to @task
      else
      flash.now[:danger] = 'Task が保存されませんでした'
      render :new 
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'    
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
  end
  
  def destroy
    @task = Task.find(params[:id])  
    @task.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to task_url
  end    

  def edit
　  @task = Task.find(params[:id])
  end
