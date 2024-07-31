module DashboardHelper
  def get_label(index)
    case index
    when 0
      "First Priority"
    when 1
      "Second Priority"
    when 2
      "Third Priority"
    else
      "Priority"
    end
  end
end