# todos_controller.rb
class TodosController < ApplicationController
  #protect_from_forgery with: :null_session

  def index
    #render plain: Todo.order(:due_date).map{ |todo| todo.to_pleasant_string}.join("\n")
    render "index.html.erb"
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: todo.to_pleasant_string
  end

  def create
    todo_text= params[:todo_text]
    due_date= DateTime.parse(params[:due_date])
    user_id= current_user.id
    new_todo = Todo.create!(
      todo_text:todo_text,
      due_date:due_date,
      completed:false,
      user_id:user_id
    )
    redirect_to todos_path
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save

    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy

    redirect_to todos_path
  end

end
