class Todo < ActiveRecord::Base
  validates :todo_text , presence: true
  validates :due_date,presence: true
  belongs_to :user

  def to_pleasant_string
    completed_icon = completed ? "[X]" : "[ ]"
    "#{id}. #{due_date.to_s(:long)} #{todo_text} #{completed_icon}"
  end
  def self.of_user(user)
    all.where(user_id: user.id)
  end
  def due_today?
    due_date == Date.today
  end

  def self.overdue
    all.where("due_date < ?", Date.today)
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.completed
    all.where(completed: true)
  end

  def self.incomplete
    all.where(completed: false)
  end
end
