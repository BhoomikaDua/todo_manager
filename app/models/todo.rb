class Todo < ActiveRecord::Base
  def to_pleasant_string
    completed_icon = completed ? "[X]" : "[ ]"
    "#{id}. #{due_date.to_s(:long)} #{todo_text} #{completed_icon}"
  end
end
