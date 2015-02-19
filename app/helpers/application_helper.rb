module ApplicationHelper
  def flash_class(level)
    case level
      when "notice" then "alert alert-info"
      when "success" then "alert alert-success"
      when "warning" then "alert alert-warning"
      when "error" then "alert alert-error"
      when "alert" then "alert alert-danger"
    end
  end

  def icon_class(level)
    case level
      when "notice" then "fa fa-info"
      when "success" then "fa fa-check"
      when "warning" then "fa fa-exclamation-triangle"
      when "error" then "fa fa-exclamation"
      when "alert" then "fa fa-exclamation-triangle"
    end
  end
end
