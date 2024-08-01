module DashboardHelper
  def get_label(index)
    case index
    when 0
      "Top Priority"
    when 1
      "High Priority"
    when 2
      "Medium Priority"
    else
      "Low Priority"
    end
  end
end