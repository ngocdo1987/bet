class ChefsController < ApplicationController
    require './lib/ar'
    
    def index
        @chefs = Ar.search(Chef, params)
        @mt = 'List chefs'
    end
    
    def show
        @chef = Chef.find(params[:id])
        @mt = "Show #{@chef.chefname}"
    end
    
    def new
        @chef = Chef.new
        @mt = 'Create chef'
    end
    
    def create
        @chef = Chef.new(chef_params)
        @mt = 'Create chef'
        if @chef.save
            flash[:success] = 'Your chef was created successfully!'
            redirect_to chefs_path
        else
           render :new 
        end
    end
    
    def edit
        @chef = Chef.find(params[:id])
        @mt = "Edit #{@chef.chefname}"
    end

    def update
        @chef = Chef.find(params[:id])
        @mt = "Edit #{@chef.chefname}"
        if @chef.update(chef_params)
            flash[:success] = 'Your chef was updated successfully!'
            redirect_to chef_path(@chef)
        else
            render :edit        
        end
    end
    private
        def chef_params
           params.require(:chef).permit(:chefname, :email) 
        end
end