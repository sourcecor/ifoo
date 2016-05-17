class Admin::UserFindsController < Admin::BaseController

  def index

  end

  def find_fillter

  end

  def create
    flash[:notice] = params[:filter][:start_date].to_s

    render :index
  end
end
