class WinesController < ApplicationController
    def index
        @wines = Wine.all
        @wine = Wine.new
        @strains = Strain.all
    end

    # def create
    #     @wine = Wine.new(wine_params)

    #     strain_ids = params[:wine][:strain_ids]
    #     strain_ids.delete("")

    #     strains = Strain.find(strain_ids)

    #     strains.each { |st| @wine.strains << st }

    #     if @wine.save
    #       flash[:success] = "Wine successfully created"
    #       redirect_to root_path
    #     else
    #       flash[:error] = "Something went wrong"
    #       redirect_to root_path
    #     end
    # end

        def create
        @wine = Wine.new(wine_params) # crea instancia del vino

        strain_ids = params[:wine][:strain_ids] # recupera el array de ids de cepas
        strain_ids.delete("") unless strain_ids.nil? # limpia el array

        strain_percents = params[:wine][:strain_percent] # recupera el array de percentajes de cepas
        strain_percents.delete("") unless strain_percents.nil? # limpia el array

        if @wine.save 

            unless strain_ids.nil?

                strain_ids.length.times do |i| # recorro n veces el array de ids que tiene el mismo largo que el de porcentajes

                    WineStrain.create( # creo una relacion entre vinos y cepas
                        wine_id: @wine.id, # asigno el id del vino a la relacion
                        strain_id: strain_ids[i], # asigno el id de la cepa a la relacion
                        percentage: strain_percents[i] # aigno el porcentaje de la cepa a la relacion
                    )

                end
            end
        end
    end          


    private
    def wine_params
        params.require(:wine).permit(:name)
    end
end
