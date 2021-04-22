class WinesController < ApplicationController
    def index
        @wines = Wine.all
        @wine = Wine.new
        @strains = Strain.all
    end

    def create
        @wine = Wine.new(wine_params)

        strain_ids = params[:wine][:strain_ids]
        strain_ids.delete("")

        strains = Strain.find(strain_ids)

        strains.each { |st| @wine.strains << st }

        if @wine.save
          flash[:success] = "Wine successfully created"
          redirect_to root_path
        else
          flash[:error] = "Something went wrong"
          redirect_to root_path
        end
    end

    private
    def wine_params
        params.require(:wine).permit(:name)
    end
end
