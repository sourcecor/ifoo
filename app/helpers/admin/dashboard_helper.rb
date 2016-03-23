module Admin::DashboardHelper

  def devise_error_messages
	alert_types = { notice: :olive, alert: :red }
	close_button_options = { class: "close icon" }
	close_button = content_tag(:i, "", close_button_options)
	alerts = flash.map do |type, message|
		alert_content = close_button + content_tag(:div, message, {class: "header"})
		alert_type = alert_types[type.to_sym] || type
		alert_class = "ui floating #{alert_type} message "
		content_tag(:div, alert_content, class: alert_class)
	end
	alerts.join("\n").html_safe
  end

end
