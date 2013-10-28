module TodoHelper
  def todo_completed(status)
    status ? "Yes" : "No"
  end
end