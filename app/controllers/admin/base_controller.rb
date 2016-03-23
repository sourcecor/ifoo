class Admin::BaseController < ApplicationController
	layout 'admin/layouts/admin'
	require 'humanize/humanize'
	before_filter :set_cache_headers
	before_action :authenticate_admin_user!
	before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) {
			|u| u.permit(:name, :email, :password, :password_confirmation)
		}
	end

  private

	def set_cache_headers
		response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
		response.headers["Pragma"] = "no-cache"
		response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
	end
end
