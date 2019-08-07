class HomeController < ApplicationController
  def index
  end

  def dashboard
  	@resource = User.find current_user.id if current_user.present?
  end
end
