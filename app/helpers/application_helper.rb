module ApplicationHelper
  def back_url(default = root_path)
    if request.referer
      uri = URI(request.referer)
      case uri.path
      when %r{^/search}
        priority_result_path
      when %r{^/comparison}
        comparison_path
      else
        default
      end
    else
      default
    end
  end

end
