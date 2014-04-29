class IndexController < ActionController::Base

  def index
    render :index, layout: 'application'
  end
end
