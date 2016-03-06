module ApplicationHelper
  def bootstrap_class_for flash_type
    case flash_type
      when "success"
        "alert-success" # Green
      when "error"
        "alert-danger" # Red
      when "alert"
        "alert-warning" # Yellow
      when "notice"
        "alert-info" # Blue
      else
        flash_type.to_s
    end
  end

  def nav_link(text, path)
    options = current_page?(path) || controller_name == text.downcase ? { class: "grid active" } : {class: "grid"}
    content_tag(:li, options) do
      link_to text, path
    end
  end
end
