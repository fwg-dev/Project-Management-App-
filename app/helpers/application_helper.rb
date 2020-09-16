module ApplicationHelper

  def render_nav_bar
    if logged_in?
      render partial: 'layouts/loggedin_links'
    else
      render partial: 'layouts/loggedout_links'
    end
  end

  def alert_class(flash_type)
    case flash_type.to_sym 
    when :notice 
      "alert-success"
    when :alert 
      "alert-warning"
    when :error 
      "alert-danger"
    end
  end
end
