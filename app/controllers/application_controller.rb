class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_cart
  include ApplicationHelper
  require 'humanize/humanize'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :cart

  private 
  # 
  def cart
    @cart
  end
  # 
  def load_cart
    @cart ||= Cart.new(session)
  end
  # 
  def after_sign_in_path_for(resource_or_scope)
    # If it's admin 
     if is_admin?
        admin_root_path
    # Otherwise
     else
        root_path
     end
  end

  def after_sign_out_path_for(resource_or_scope)
    # If it's admin 
     if is_admin?
        admin_root_path
    # Otherwise
     else
        root_path
     end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:account_update) << :username
  end
end
