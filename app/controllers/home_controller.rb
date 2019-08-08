class HomeController < ApplicationController
  
  def index
  end

  def painting
  		@painting = Painting.where(user_id: params[:user_id]).where(public: true)
  	if !@painting.present?
  		flash[:alert] = "No public painting available for the Artist"
  	end
  end

  def dashboard
  	@paintings_all = current_user.paintings
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

	def make_public
		if params[:id] and params[:checked] == "true"
			@painting = Painting.find(params[:id])
			@painting.update_attributes(public: true)
			flash[:notice] = "Painting is public now"
			render :text => "Success"
		elsif params[:id] and params[:checked] == "false"
			@painting = Painting.find(params[:id])
			@painting.update_attributes(public: false)
			flash[:notice] = "Painting is no more public"
			render :text => "Success"
		else
			flash[:notice] = "Unable to make public something went wrong"
			render :text => "Error"
		end
	end

	private
	def user_params
	  params.require(:painting).permit(:picture)
	end

end