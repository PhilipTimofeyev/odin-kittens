class KittensController < ApplicationController

	def index
		@kittens = Kitten.all
	end

	def new
		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.new(kitten_params)

		if @kitten.save
			flash[:success] = "Kitten has been adopted!" 
			redirect_to @kitten
		else
			flash[:failure] = "Enter all the fields goober!"
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		@kitten = Kitten.find(params[:id]) 
	end

	def show
		@kitten = Kitten.find(params[:id])
	end

	def update
		@kitten = Kitten.find(params[:id]) 

		if @kitten.update(kitten_params)
			flash[:success] = "Kitten updated!" 
			redirect_to @kitten
		else
			flash[:failure] = "Please enter all fields goober!"
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
	  @kitten = Kitten.find(params[:id])
	  @kitten.destroy
	  flash[:success] = "Kitten has been released!" 

	  redirect_to root_path, status: :see_other
	end

	private

	def kitten_params
		params.require(:kitten).permit(:name, :age, :cuteness, :softness)
	end
end
