class HomeController < ApplicationController
  
  def index
  end

  def painting
  		@painting = Painting.where(user_id: params[:user_id])
  	if !@painting.present?
  		flash[:alert] = "No public painting available for the Artist"
  	end
  end

  def dashboard
  	@paintings_all = Painting.all
  	@painting = Painting.new
  end

	def create
	  @painting = Painting.new(user_params)
	  @painting.user_id = current_user.id
	  if @painting.save
	  	flash[:notice] = "Painting saved succesfully"
			redirect_to authenticated_root_path	
		else
			flash[:notice] = "Unable to Save something went wrong"
			redirect_to authenticated_root_path
		end
	end

	private
	def user_params
	  params.require(:painting).permit(:picture)
	end

end