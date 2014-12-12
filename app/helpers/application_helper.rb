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
      when "notice" then "glyphicon glyphicon-info-sign"
      when "success" then "glyphicon glyphicon-ok-sign"
      when "warning" then "glyphicon glyphicon-exclamation-sign"
      when "error" then "glyphicon glyphicon-exclamation-sign"
      when "alert" then "glyphicon glyphicon-exclamation-sign"
    end
  end
end
