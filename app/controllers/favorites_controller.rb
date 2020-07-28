class FavoritesController < ApplicationController
    before_action :find_favorite, only: [:destroy]

    def create
        @favorite = Favorite.create(
            user_id: params[:user_id],
            pub_name: params[:pub_name]
        )

        render json: { alert: 'Added to your Favorites' }, status: :created
    end

    def destroy
        @favorite.desrtroy
        render json: { alert: 'Removed from Favorites' }, status: :no_content
    end

    private

    def favorite_params
        params.require(:favorite).permit(:user_id, :pub_name)
    end

    def find_favorite
        @favorite = Favorite.find(params[:id})
    end
end
