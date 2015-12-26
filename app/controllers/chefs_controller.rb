class ChefsController < ApplicationController
    def index
        @chefs = Chef.all
    end
    
    def show
        @chef = Chef.find(params[:id])
    end
    
    def new
        @chef = Chef.new
    end
    
    def create
        @chef = Chef.new(chef_params)
        if @chef.save
            flash[:success] = "Your chef was created successfully!"
            redirect_to chefs_path
        else
           render :new 
        end
    end
    
    private
        def chef_params
           params.require(:chef).permit(:chefname, :email) 
        end
end