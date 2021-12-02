class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :dietary_requirements])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :dietary_requirements])
  end

  def default_url_options
  { host: ENV["www.sous-chef.site"] || "localhost:3000" }
  end
end
