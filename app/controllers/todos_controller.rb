# todos_controller.rb
class TodosController < ApplicationController
  #protect_from_forgery with: :null_session

  def index
    @todos = Todo.of_user(current_user)
    render "index.html.erb"
  end

  def show
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    render plain: todo.to_pleasant_string
  end

  def create
    todo_text= params[:todo_text]
    due_date= params[:due_date]
    user_id= current_user.id
    new_todo = Todo.new(
      todo_text:todo_text,
      due_date:due_date,
      completed:false,
      user_id:user_id
    )

    if new_todo.save
      redirect_to todos_path
    else
      flash[:error] = "Invalid Fields!"
      redirect_to todos_path
    end

  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.of_user(current_user).find(id)
    todo.completed = completed
    todo.save

    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    todo.destroy

    redirect_to todos_path
  end

end
